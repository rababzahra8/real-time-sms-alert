# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SmsAlertsController do
  describe 'GET #index' do
    context 'when user is signed in' do
      let(:user) { create(:user) }

      before do
        sign_in user
        get :index
      end

      it 'assigns @current_user_profile with the current user' do
        expect(assigns(:current_user_profile)).to eq(user)
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end

      it 'responds with a success status code' do
        expect(response).to have_http_status(:success)
      end
    end

    context 'when user is not signed in' do
      it 'redirects to the sign-in page' do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST #create' do
    let(:user) { create(:user, phone_number: ENV.fetch('TWILIO_FROM_SENDER', nil)) }

    before do
      sign_in user
    end

    context 'with valid parameters' do
      let(:valid_params) { { msg: 'sms is sent' } }

      it 'sends an SMS and sets flash notice' do
        allow_any_instance_of(Twilio::RealTimeSmsService).to receive(:send_sms_alert).and_return(status: 201)

        post :create, params: valid_params

        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq('sms is sent')
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) { { msg: 'Your message here' } }

      it 'does not send an SMS and sets flash alert' do
        allow_any_instance_of(Twilio::RealTimeSmsService).to receive(:send_sms_alert).and_return(status: false, msg: 'Error message')

        post :create, params: invalid_params

        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to eq('Error message')
      end
    end
  end
end

# frozen_string_literal: true

class SmsAlertsController < ApplicationController
  before_action :authenticate_user!

  def index
    @current_user_profile = current_user
  end

  def create
    response = Twilio::RealTimeSmsService.new(current_user.phone_number, params[:msg], current_user.name).send_sms_alert

    if response.fetch(:status)
      flash[:notice] = params[:msg]
    else
      flash[:alert] = response.fetch(:msg)
    end

    redirect_to root_path
  end
end

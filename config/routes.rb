# frozen_string_literal: true

Rails.application.routes.draw do
  root 'sms_alerts#index'

  devise_for :users

  resources :sms_alerts, only: %i[index create]
end

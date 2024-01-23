# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :phone_number, format: { with: /\A\+\d{2}\d{9,15}\z/, message: 'invalid!' }
  after_commit :send_welcome_sms, on: %i[create update], if: -> { saved_change_to_phone_number? }

  private

  def send_welcome_sms
    response = Twilio::RealTimeSmsService.new(phone_number, SIGN_UP_ALERT_TEXT, name).send_sms_alert
    return if response.fetch(:status)

    errors.add(:base, response.fetch(:msg))
    raise ActiveRecord::Rollback
  end
end

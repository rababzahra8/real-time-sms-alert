# frozen_string_literal: true

module Twilio
  class RealTimeSmsService
    attr_reader :message, :contact, :name

    def initialize(contact, message, name)
      @contact = contact
      @message = "Hey #{name}, #{message}"
    end

    def send_sms_alert
      twilio_sender = ENV.fetch('TWILIO_FROM_SENDER', nil)
      account_sid = ENV.fetch('TWILIO_ACCOUNT_SID', nil)
      auth_token = ENV.fetch('TWILIO_AUTH_TOKEN', nil)

      @client = Twilio::REST::Client.new(account_sid, auth_token)

      @client.messages.create(
        body: message,
        from: twilio_sender,
        to: contact
      )
      { status: @client.http_client.last_response.status_code == 201 }
    rescue Twilio::REST::RestError => e
      handle_twilio_rest_error(e)
    end

    private

    def handle_twilio_rest_error(error)
      { status: false, msg: (error.code == 21_211 ? 'Phone number is invalid!' : "Twilio Error: (#{error.message})") }
    end
  end
end

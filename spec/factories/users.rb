# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'helloworld12' }
    name { Faker::Name.name }
    phone_number { ENV.fetch('TWILIO_TO_NUMBER') }
  end
end

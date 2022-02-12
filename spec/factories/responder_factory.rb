# frozen_string_literal: true

FactoryBot.define do
  # Default
  # It will use the User class
  factory :user do
    first_name { Faker::FunnyName.name }
    last_name { Faker::Name.name }
    email { "email_#{rand(1_000)}@respondersnow_test.com" }
    password { "password1234" }

    confirmed_at { 1.day.ago }
  end
end

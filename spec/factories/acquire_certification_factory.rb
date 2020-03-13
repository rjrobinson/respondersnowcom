# frozen_string_literal: true

FactoryBot.define do
  factory :acquired_certification do
    acquired_on { DateTime.now }
    certification
    expires { false }
    number { "54673" }
    state { "NJ" }
    user { User.first || create(:user) }


    trait :expires do
      expires { false }
      expires_on { 100.days.from_now }
    end
  end
end

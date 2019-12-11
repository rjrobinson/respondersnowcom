# frozen_string_literal: true

FactoryBot.define do
  factory :acquired_certification do
    user { User.first || association(:user) }
    certification
    number { "54673" }
    acquired_on { DateTime.now }
    state { "NJ" }
    expires { false }


    trait :expires do
      expires { false }
      expires_on { 100.days.from_now }
    end
  end
end

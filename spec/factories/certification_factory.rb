# frozen_string_literal: true

FactoryBot.define do
  factory :certification do
    creator { User.first || association(:user) }
    name { "Emergency Medical Tech" }
    abbvr { "EMT" }
    active { nil }
    course_code { "EMS" }
    primary { false }
  end
end

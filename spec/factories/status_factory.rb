# frozen_string_literal: true

FactoryBot.define do
  factory :incident_status do
    name { "unconfirmed" }
    abvr { "u" }
    code { "1" }
  end
end

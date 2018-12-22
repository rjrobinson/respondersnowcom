# frozen_string_literal: true

FactoryBot.define do
  factory :incident do
    message {"MVA Car Vs Pole"}
    location {create(:location)}
    incident_group {create(:incident_group)}
    incident_status {create(:incident_status)}
  end
end

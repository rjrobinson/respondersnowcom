FactoryBot.define do

  factory :incident do

    message {"MVA Car Vs Pole"}
    location {create(:location)}
    incident_type {create(:incident_type)}
    status {"On Going"}

  end
end
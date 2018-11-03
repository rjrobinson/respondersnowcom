# frozen_string_literal: true

FactoryBot.define do
  factory :hospital do
    name {'Some Random Hospital'}
    county {"middlesex"}
    abilities {"cool. abilities."}

    association :location

  end
end

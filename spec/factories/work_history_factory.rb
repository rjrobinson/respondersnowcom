# frozen_string_literal: true

FactoryBot.define do
  factory :work_history do
    agency
    user
    start_date { 10.months.ago }
    end_date { 1.day.ago }
    status { "employed" }
    title { "EMT" }
    current { false }

  end
end

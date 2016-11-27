FactoryGirl.define do

  factory :agency do
    name 'FDNY'
    email 'tstark@avengers.org'
    password 'password1234'

    confirmed_at 1.day.ago
  end
end

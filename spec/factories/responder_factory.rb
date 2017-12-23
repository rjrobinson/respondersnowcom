FactoryBot.define do

  # Default
  # It will use the User class
  factory :responder do
    first_name 'Tony'
    last_name 'Stark'
    email 'tstark@avengers.org'
    password 'password1234'

    confirmed_at 1.day.ago
  end
end

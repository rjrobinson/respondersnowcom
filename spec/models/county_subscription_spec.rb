require 'rails_helper'

RSpec.describe CountySubscription, type: :model do
  describe "validations" do
    it {should belong_to(:user)}
    it {should belong_to(:county)}
  end
end

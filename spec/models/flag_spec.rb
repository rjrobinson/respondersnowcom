# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Flag, type: :model do
  describe "validations" do
    it { should belong_to :user }

    it { should belong_to :flaggable }

    it { should validate_presence_of :reason }

    it 'should validate that the user can only flag once' do
      incident = create(:incident)
      user = create(:user)
      Flag.create(flaggable: incident, user: user, reason: "no reason")

      other_flag = Flag.new(flaggable: incident, user: user, reason: "no reason")
      other_flag.valid?

      expect(other_flag.errors.count).to eq 1
    end
  end
end

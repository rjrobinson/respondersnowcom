# frozen_string_literal: true

require "rails_helper"

RSpec.describe Flag, type: :model do
  describe "validations" do
    it { is_expected.to belong_to :user }

    it { is_expected.to belong_to :flaggable }

    it { is_expected.to validate_presence_of :reason }

    it "validates that the user can only flag once" do
      incident = create(:incident)
      user = create(:user)
      described_class.create(flaggable: incident, user: user, reason: "no reason")

      other_flag = described_class.new(flaggable: incident, user: user, reason: "no reason")
      other_flag.valid?

      expect(other_flag.errors.count).to eq 1
    end
  end
end

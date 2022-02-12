# frozen_string_literal: true

require "rails_helper"

describe Confirmation, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:confirmable) }
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    context "if a user tries to comfirm the same incident twice" do
      subject { described_class.new(confirmable: incident, user: user) }

      let(:incident) { create(:incident) }
      let(:user) { create(:user) }

      before(:each) do
        incident.confirm(user: user)
      end

      it "is not valid" do
        expect(subject.valid?).to be false
      end
    end
  end
end

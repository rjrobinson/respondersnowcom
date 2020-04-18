# frozen_string_literal: true

require 'rails_helper'

describe Confirmation, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:confirmable) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    context 'if a user tries to comfirm the same incident twice' do
      let(:incident) { create(:incident) }
      let(:user) { create(:user) }

      before do
        incident.confirm(user: user)
      end

      subject { described_class.new(confirmable: incident, user: user) }

      it 'should not be valid' do
        expect(subject.valid?).to be false
      end
    end
  end
end

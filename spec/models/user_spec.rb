# frozen_string_literal: true

require 'rails_helper'

describe User, type: :model do
  describe 'associations' do
    # it { is_expected.to have_one_attached(:avatar) }
    it { is_expected.to have_many(:acquired_certifications) }
    it { is_expected.to have_many(:certifications) }
    it { is_expected.to have_many(:counties) }
    it { is_expected.to have_many(:county_subscriptions) }
    it { is_expected.to have_many(:votes) }
    it { is_expected.to have_many(:work_histories) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
  end

  describe '#methods' do
    let(:user) { create(:user) }

    describe '#can_confirm?' do
      it "should return true" do
        expect(user.can_confirm?).to be true
      end
    end

    describe '#display_id' do
      it "should return a string" do
        expect(user.display_id).to be_a_kind_of(String)
      end
    end

    describe '#incidents' do
      it "should return a array" do
        expect(user.incidents).to be_a_kind_of(ActiveRecord::Relation)
      end
    end

    describe '#name' do
      it "should return a string" do
        expect(user.name).to be_a_kind_of String
      end
    end

    describe '#full_name' do
      it "should return a string" do
        expect(user.full_name).to be_a_kind_of String
      end
    end
  end
end

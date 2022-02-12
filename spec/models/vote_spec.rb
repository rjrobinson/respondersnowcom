# frozen_string_literal: true

require "rails_helper"

RSpec.describe Vote, type: :model do
  describe "validations" do
    it { is_expected.to belong_to :user }

    it { is_expected.to belong_to :voteable }

    it { is_expected.to validate_presence_of :vote_value }

    it "validates that the user can only vote once" do
      incident = create(:incident)
      user = create(:user)
      described_class.create(voteable: incident, user: user, vote_value: 1)

      other_vote = described_class.new(voteable: incident, user: user, vote_value: 1)
      other_vote.valid?

      expect(other_vote.errors.count).to eq 1
    end
  end

  describe "#upvote" do
    it "increases the vote by 1" do
      incident = create(:incident)
      user = create(:user)

      vote = described_class.create(voteable: incident, user: user)
      vote.upvote

      expect(vote.vote_value).to be 1
    end
  end

  describe "#downvote" do
    it "decreases the vote by 1" do
      incident = create(:incident)
      user = create(:user)

      vote = described_class.create(voteable: incident, user: user)
      vote.downvote

      expect(vote.vote_value).to be(-1)
    end
  end

  describe "#remove" do
    it "decreases the vote by 1" do
      incident = create(:incident)
      user = create(:user)

      vote = described_class.create(voteable: incident, user: user)
      vote.remove

      expect(vote.vote_value).to be 0
    end
  end
end

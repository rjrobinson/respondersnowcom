# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Vote, type: :model do
  describe "validations" do
    it { should belong_to :user }

    it { should belong_to :voteable }

    it { should validate_presence_of :vote_value }

    it 'should validate that the user can only vote once' do
      incident = create(:incident)
      user = create(:user)
      Vote.create(voteable: incident, user: user, vote_value: 1)

      other_vote = Vote.new(voteable: incident, user: user, vote_value: 1)
      other_vote.valid?

      expect(other_vote.errors.count).to eq 1
    end
  end

  describe "#upvote" do
    it 'should increase the vote by 1' do
      incident = create(:incident)
      user = create(:user)

      vote = Vote.create(voteable: incident, user: user)
      vote.upvote

      expect(vote.vote_value).to be 1
    end
  end

  describe "#downvote" do
    it 'should decrease the vote by 1' do
      incident = create(:incident)
      user = create(:user)

      vote = Vote.create(voteable: incident, user: user)
      vote.downvote

      expect(vote.vote_value).to be(-1)
    end
  end

  describe "#remove" do
    it 'should decrease the vote by 1' do
      incident = create(:incident)
      user = create(:user)

      vote = Vote.create(voteable: incident, user: user)
      vote.remove

      expect(vote.vote_value).to be 0
    end
  end
end

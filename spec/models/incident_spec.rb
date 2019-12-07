# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Incident, type: :model do
  describe 'validations' do
    it { should belong_to(:location) }
    it { should belong_to(:incident_group) }
    it { should belong_to(:incident_status) }
    it { should have_many(:votes) }

    it { should have_many(:incident_reports) }
  end


  let(:incident) { create(:incident) }
  let(:user) { create(:user) }


  describe '.trending' do
    context 'when calculating trending' do

      let!(:incident) { create(:incident) }
      
      subject { described_class.trending }

      it 'should be a kind of an Array' do
        expect(subject).to be_an_kind_of(Array)
      end

      it 'should return a list of incidents by trending score and id' do
        expect(subject).to include array_including(an_instance_of(Integer), incident.id)
      end


    end
  end

  describe '#status' do

    it 'is expected to return a IncidentStatus' do
      expect(incident.status.class).to eq IncidentStatus
    end

  end

  describe "#upvote" do
    it 'should increase the vote by one.' do
      incident.upvote(user: user)
      expect(incident.votes.count).to eq 1
      expect(incident.score).to eq 1
      expect(incident.upvotes).to eq 1

      incident.remove_vote(user: user)
    end

  end

  describe "#downvote" do
    it 'should decrease the vote by one.' do
      incident.downvote(user: user)


      expect(incident.votes.count).to eq 1
      expect(incident.score).to eq -1
      expect(incident.downvotes).to eq 1

      incident.remove_vote(user: user)

      expect(incident.votes.count).to eq 0
      expect(incident.score).to eq 0
    end
  end

  describe "#new_with_location" do
    it 'should create a new incident' do
      location = create(:location)
      user     = create(:user)
      params   = {
          street:     location.street,
          city:       location.city,
          state:      location.state,
          status:     "Just started, unconfirmed",
          scene_type: "EMS",
          message:    "CrazyTown"
      }


      incident = Incident.new_with_location(params.merge(user: user))

      expect(incident).to be_valid
    end
  end
end

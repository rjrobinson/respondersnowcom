require 'rails_helper'

RSpec.describe Incident, type: :model do
  describe 'validations' do
    it {should belong_to(:location)}
    it {should belong_to(:incident_type)}
    it {should have_many(:votes)}
    it {should have_many(:incident_confirmeds)}
    it {should have_many(:incident_flags)} # change the name of this to just Flag
    it {should have_many(:incident_reports)}
  end


  let(:incident) {create(:incident)}
  let(:user) {create(:user)}

  describe "#upvote" do

    it 'should increase the vote by one.' do

      incident.upvote(user: user)


      expect(incident.votes.count).to eq 1
      expect(incident.score).to eq 1
      expect(incident.upvotes).to eq 1

      incident.remove_vote(user: user)
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
        user = create(:user)
        params = {
            street: location.street,
            city: location.city,
            state: location.state,
            status: "Just started, unconfirmed",
            scene_type: "EMS",
            message: "CrazyTown"
        }


        incident = Incident.new_with_location(params.merge(user: user))

        expect(incident).to be_valid
      end

    end
  end
end

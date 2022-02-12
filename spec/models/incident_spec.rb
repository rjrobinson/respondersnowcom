# frozen_string_literal: true

require "rails_helper"

RSpec.describe Incident, type: :model do
  let(:user2) { create(:user, email: "some other email", name: "some other name") }
  let(:user) { create(:user) }
  let(:incident) { create(:incident) }

  describe "validations" do
    it { is_expected.to belong_to(:location) }
    it { is_expected.to belong_to(:incident_group) }
    it { is_expected.to belong_to(:incident_status) }
    it { is_expected.to have_many(:votes) }

    it { is_expected.to have_many(:incident_reports) }
  end

  describe "#confirm" do
    context "when a user confirms an incident" do
      it "adds the confirmed flag" do
        expect(incident.confirm(user: user)).to be_truthy
      end
    end

    context "when a user tries to confirm the same incident" do
      before(:each) do
        incident.confirm(user: user)
      end

      it "throws an error" do
        incident.confirm(user: user)

        expect(incident.errors).to include(:user_already_confirmed)
      end
    end
  end

  describe "rank calculation" do
    describe ".calculate_rank" do
      before(:each) do
        described_class.calculate_rank
      end

      it "calculates rank of incidents" do
        expect(described_class.where(rank: nil).count).to eq 0
      end
    end

    describe "#calculate_rank" do
      before(:each) do
        incident.calculate_rank
      end

      it "calculates rank of incident" do
        expect(incident.rank).to be_a_kind_of(Float)
      end
    end

    describe "#current_rank?" do
      it "returns a current rank" do
        expect(incident.current_rank).to be_a_kind_of(Numeric)
      end
    end

    describe "#trending?" do
      it "should_be trending" do
        expect(incident).not_to be_trending
      end
    end
  end

  describe "#resolve_stale" do
    context "when an incident has been declared of a stale status" do
      it "is expected to update the incident status to clear" do
        incident.resolve_stale

        cleared_status = IncidentStatus.find_by(name: "clear")
        expect(incident.status).to eq cleared_status
      end
    end
  end

  # TODO: this should be pulled out.
  describe "#or_one_minute" do
    it "returns one minute ago if no date passed" do
      expect(incident.or_one_minute(some_date: Time.zone.now)).to be_truthy
    end
  end

  describe ".trending" do
    context "when calculating trending" do
      subject { described_class.trending }

      let!(:incident) { create(:incident) }

      it "is a kind of an Array" do
        expect(subject).to be_an_kind_of(Array)
      end

      it "returns a list of incidents by trending score and id" do
        expect(subject).to include array_including(an_instance_of(Integer), incident.id)
      end
    end
  end

  describe "#status" do
    it "is expected to return a IncidentStatus" do
      expect(incident.status.class).to eq IncidentStatus
    end
  end

  describe "#upvote" do
    it "increases the vote by one." do
      incident.upvote(user: user)
      expect(incident.votes.count).to eq 1
      expect(incident.score).to eq 1
      expect(incident.upvotes).to eq 1

      incident.remove_vote(user: user)
    end
  end

  describe "#downvote" do
    it "decreases the vote by one." do
      incident.downvote(user: user)

      expect(incident.votes.count).to eq 1
      expect(incident.score).to eq(-1)
      expect(incident.downvotes).to eq 1

      incident.remove_vote(user: user)

      expect(incident.votes.count).to eq 0
      expect(incident.score).to eq 0
    end
  end

  describe "#new_with_location" do
    it "creates a new incident" do
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

      incident = described_class.new_with_location(params.merge(user: user))

      expect(incident).to be_valid
    end
  end
end

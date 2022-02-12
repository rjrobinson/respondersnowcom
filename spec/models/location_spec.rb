# frozen_string_literal: true

require "rails_helper"

describe Location, type: :model do
  describe "#new_by_coord" do
    context "when passing coords of an existing location" do
      subject do
        described_class.new_by_coord(lat: location.latitude, long: location.longitude)
      end

      let(:location) { create(:location) }

      it "is expected to find and return that location" do
        expect(subject).to eq location
      end
    end

    context "when passing coords of a new location" do
      subject do
        described_class.new_by_coord(lat: 40.4540323, long: -40.4540323)
      end

      it "is expected to find and return that location" do
        expect(subject).to be_truthy
      end

      it "is expected to return no errors" do
        expect(subject.errors.any?).to eq false
      end
    end

    context "when missing coords" do
      subject do
        described_class.new_by_coord(lat: nil, long: nil)
      end

      it "is expected to return errors" do
        expect(subject.errors.any?).to eq true
        expect(subject.errors).to include(:coord)
      end
    end
  end

  describe "#county_lookup" do
    let!(:other_location) { described_class.create(city: "north brunswick", state: "NJ", county: "middlesex") }
    let(:location) { create(:location, state: "New Jersey", county: nil) }

    context "when county is nil" do
      before(:each) do
        location.county_lookup
      end

      it "looks up county" do
        expect(location.county).to be_truthy
      end
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

describe Location, type: :model do


  describe '#new_by_coord' do

    context 'when passing coords of an existing location' do
      let(:location) { FactoryBot.create(:location) }
      subject {
        described_class.new_by_coord(lat: location.latitude, long: location.longitude)
      }

      it 'is expected to find and return that location' do
        expect(subject).to eq location
      end
    end

    context 'when passing coords of a new location' do
      subject {
        described_class.new_by_coord(lat: 40.4540323, long: -40.4540323)
      }

      it 'is expected to find and return that location' do
        expect(subject).to be_truthy
      end

      it 'is expected to return no errors' do
        expect(subject.errors.any?).to eq false
      end
    end

    context 'when missing' do
      subject {
        described_class.new_by_coord(lat: nil, long: nil)
      }

      it 'is expected to return errors' do
        expect(subject.errors.any?).to eq true
        expect(subject.errors).to include(:coord)
      end
    end

  end
end

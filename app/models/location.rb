# frozen_string_literal: true

class Location < ApplicationRecord
  geocoded_by :address

  before_validation :geocode

  reverse_geocoded_by :latitude, :longitude do |obj, results|
    if geo = results.first
      obj.city    ||= geo.city
      obj.state   ||= StatesHelper::STATE_NAME_TO_ABBR[geo.state] || StatesHelper::STATE_ABBR_TO_NAMER[geo.state]
      obj.zipcode ||= geo.postal_code
    end
  end

  after_create :reverse_geocode

  after_create :county_lookup


  def self.new_by_coord(lat:, long:)
    if !lat || !long
      loc = Location.new
      loc.errors.add(:coord, "missing coords")
      return loc
    end
    Location.find_or_create_by(latitude: lat, longitude: long)
  end

  def address
    [street, city, state, country].compact.join(', ')
  end

  def county_lookup
    return nil if county
    if state && state&.length > 2
      update(state: StatesHelper::STATE_NAME_TO_ABBR[state])
    end

    found = Location.where(city: city, state: state).pluck(:county).compact.first
    update(county: found) if found
  end
end

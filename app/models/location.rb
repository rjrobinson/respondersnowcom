class Location < ApplicationRecord

  geocoded_by :address

  after_validation :geocode, if: ->(obj) {obj.address.present? && obj.address_changed?}

  private

  def populate

  end

end

# frozen_string_literal: true

class HospitalStatus < ApplicationRecord
  belongs_to :hospital


  def expired?
    self.expire_time < Time.zone.now
  end
end
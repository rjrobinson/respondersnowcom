# frozen_string_literal: true

class NullHospitalStatus
  attr_reader :county, :expire_time, :start_time, :status, :created_at, :updated_at, :id, :reason

  def initialize
    @id = SecureRandom.uuid
    @county = nil
    @expire_time = nil
    @start_time = nil
    @status = "Open"
    @reason = "No Reported Issues"
    @created_at = Time.now
    @updated_at = Time.now
  end
end

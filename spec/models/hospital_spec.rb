# frozen_string_literal: true

require "rails_helper"

RSpec.describe Hospital, type: :model do
  describe "validations" do
    it { is_expected.to belong_to :location }

    it { is_expected.to have_many :hospital_statuses }
  end

  describe "#on_divert" do
    it "returns only hospitals on divert" do
      hospital = create(:hospital)
      hospital.hospital_statuses.create(county: "MIDDLESEX",
                                        status: "ON DIVERT",
                                        start_time: Time.zone.now,
                                        expire_time: 1.day.from_now)

      expect(described_class.on_divert.count).to eq 1

      expect(hospital.last_status_expired?).to eq false
      expect(hospital.status).to eq HospitalStatus.last
    end
  end
end

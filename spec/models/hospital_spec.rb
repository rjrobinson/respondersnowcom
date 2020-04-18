# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe "validations" do
    it { should belong_to :location }

    it { should have_many :hospital_statuses }
  end

  describe "#on_divert" do
    it 'should return only hospitals on divert' do
      hospital = create(:hospital)
      hospital.hospital_statuses.create(county: "MIDDLESEX",
                                        status: "ON DIVERT",
                                        start_time: Time.now,
                                        expire_time: Time.now + 1.day)

      expect(Hospital.on_divert.count).to eq 1

      expect(hospital.last_status_expired?).to eq false
      expect(hospital.status).to eq HospitalStatus.last
    end
  end
end

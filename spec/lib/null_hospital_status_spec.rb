# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NullHospitalStatus, type: :class do
  describe 'null class' do
    let(:status) { NullHospitalStatus.new }

    it { expect(status).to be_truthy }
  end
end
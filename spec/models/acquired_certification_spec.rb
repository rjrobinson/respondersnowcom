# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AcquiredCertification, type: :model do

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:certification) }

  end

  describe 'validations' do

  end
end


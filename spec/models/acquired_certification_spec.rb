# frozen_string_literal: true

require 'rails_helper'

describe AcquiredCertification do
  describe 'validations' do
    it { should belong_to(:user) }
    it { should belong_to(:certification) }
    # it { should validate_uniqueness_of(:number) }
  end
end

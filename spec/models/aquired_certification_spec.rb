require 'rails_helper'

describe AquiredCertification do

  describe 'validations' do
    it { should belong_to(:responder) }
    it { should belong_to(:certification) }
    # it { should validate_uniqueness_of(:number) }
  end
end

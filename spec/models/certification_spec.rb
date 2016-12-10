require 'rails_helper'

describe Certification do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end

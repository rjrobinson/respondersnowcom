require 'rails_helper'

describe Responder do

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

end

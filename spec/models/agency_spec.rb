require 'rails_helper'

describe Agency do

  describe 'validations' do
    it { should validate_presence_of(:name) }

    # it { should validate_presence_of(:email) }
    # TODO
    # remove for now due to test cases and agency not currently being complete
  end

end

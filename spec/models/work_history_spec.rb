require 'rails_helper'

describe WorkHistory do

  describe 'validations' do
    it { should belong_to(:responder) }
    it { should belong_to(:agency) }
    

  end

end

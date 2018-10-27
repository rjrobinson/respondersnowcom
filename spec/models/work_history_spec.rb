# frozen_string_literal: true

require 'rails_helper'

describe WorkHistory do
  describe 'validations' do
    it { should belong_to(:user) }
    it { should belong_to(:agency) }
  end
end

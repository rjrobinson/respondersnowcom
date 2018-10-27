# frozen_string_literal: true

require 'rails_helper'

describe User do
  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should have_many(:work_histories) }
  end
end

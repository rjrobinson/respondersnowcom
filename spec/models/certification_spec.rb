# frozen_string_literal: true

require 'rails_helper'

describe Certification do
  describe 'associations' do
    it { is_expected.to belong_to(:creator) }
    it { is_expected.to respond_to(:logo) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end

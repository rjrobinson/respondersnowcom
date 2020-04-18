# frozen_string_literal: true

require "rails_helper"

RSpec.shared_examples :a_node_type do
  subject { described_class }

  it { is_expected.to have_field(:id).of_type("ID!") }
  it { is_expected.to have_field(:errors).of_type("[ActiveRecordError!]") }
  it { is_expected.to have_field(:created_at).of_type("ISO8601DateTime!") }
  it { is_expected.to have_field(:updated_at).of_type("ISO8601DateTime!") }
end

# frozen_string_literal: true

require "rails_helper"

RSpec.describe Types::UserType do
  subject { described_class }

  it_behaves_like(:a_node_type)

  it { is_expected.to have_field(:full_name).of_type("String!") }
  it { is_expected.to have_field(:display_id).of_type("ID!") }
  it { is_expected.to have_field(:acquired_certifications).of_type("[AcquiredCertification!]") }
end

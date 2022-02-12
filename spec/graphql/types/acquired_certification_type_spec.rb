# frozen_string_literal: true

require "rails_helper"

RSpec.describe Types::AcquiredCertificationType do
  subject { described_class }

  it_behaves_like("a node type")
  it { is_expected.to have_field(:acquired_on).of_type("ISO8601DateTime!") }
  it { is_expected.to have_field(:certification).of_type("Certification!") }
  it { is_expected.to have_field(:ceus).of_type("Int") }
  it { is_expected.to have_field(:expires).of_type("Boolean!") }
  it { is_expected.to have_field(:expires_on).of_type("ISO8601DateTime") }
  it { is_expected.to have_field(:number).of_type("String") }
  it { is_expected.to have_field(:state).of_type("String!") }
end

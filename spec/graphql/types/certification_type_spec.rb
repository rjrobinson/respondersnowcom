# frozen_string_literal: true

require "rails_helper"

RSpec.describe Types::CertificationType do
  subject { described_class }

  it_behaves_like("a node type")

  it { is_expected.to have_field(:abvr).of_type("String!") }
  it { is_expected.to have_field(:active).of_type("Boolean!") }
  it { is_expected.to have_field(:course_code).of_type("String!") }
  it { is_expected.to have_field(:name).of_type("String!") }
end

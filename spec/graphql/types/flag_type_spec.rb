# frozen_string_literal: true

require "rails_helper"

RSpec.describe Types::FlagType do
  subject { described_class }

  it_behaves_like("a node type")

  it { is_expected.to have_field(:message).of_type("String!") }
  it { is_expected.to have_field(:reason).of_type("String!") }

  describe "user" do
    subject { described_class.fields["user"] }

    it { is_expected.to be_of_type("User!") }
  end
end

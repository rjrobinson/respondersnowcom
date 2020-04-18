# frozen_string_literal: true
## frozen_string_literal: true
#
# require "rails_helper"
#
# RSpec.describe Types::QueryType do
#  subject(:query_type) { described_class }
#
#  it { is_expected.to have_field(:client_locations).of_type("ClientLocationConnection!") }
#  it { is_expected.to have_field(:case_managers).of_type("[CaseManager!]!") }
#  it { is_expected.to have_field(:client_location).of_type("ClientLocation") }
#
#  describe "client_locations field" do
#    subject { query_type.fields["clientLocations"] }
#
#    it { is_expected.to accept_argument(:pageSize).of_type("Int") }
#    it { is_expected.to accept_argument(:pageNumber).of_type("Int") }
#    it { is_expected.to accept_argument(:filter).of_type("ClientLocationFilter") }
#  end
#
#  describe "client_location field" do
#    subject { query_type.fields["clientLocation"] }
#
#    it { is_expected.to accept_argument(:id).of_type("ID!") }
#  end
# end

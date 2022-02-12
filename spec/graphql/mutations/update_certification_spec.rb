## frozen_string_literal: true
##
# frozen_string_literal: true

require "rails_helper"
require_relative "../../test_helpers"

describe Mutations::CreateCertification, type: :mutations do
  include GraphQL::TestHelpers

  # Boiler Plate
  # set mutation_type
  # set input_type if_any
  # set mutation keys ( the ones that get returned)
  # set variables *default
  # set user
  subject(:update_certification) do
    mutation(mutation_string, variables: variables, context: { current_user: user })
    raise GraphQL::TestHelpers::GraphqlException, gql_response if gql_response.errors

    gql_response.data[mutation_type].deep_symbolize_keys
  end

  let(:mutation_type) { "updateCertification" }
  let(:variables) { { CertificationInput: {} } }
  let(:mutation_keys) { "certification { id name }" }
  let(:mutation_string) do
    <<-GQL
          mutation #{mutation_type}($certificationInput: CertificationInput!) {
                   #{mutation_type}(certificationInput: $certificationInput) {
                   #{mutation_keys}}}
    GQL
  end
  let(:user) { create(:user) }
  let(:certification) { create(:certification) }

  context "a user can request a certification to be added" do
    let(:variables) do
      { certificationInput: {
        id: certification.id,
        abbvr: "example",
        active: false,
        course_code: "EX",
        name: "exmaple of updated certification"

      } }
    end

    it { is_expected.to include(certification: { id: be_a_kind_of(String), name: "exmaple of updated certification" }) }
  end
end

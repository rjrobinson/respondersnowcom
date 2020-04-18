## frozen_string_literal: true
##
# frozen_string_literal: true
require 'rails_helper'
require_relative '../../test_helpers'

describe Mutations::CreateAcquiredCertification, type: :mutations do
  include GraphQL::TestHelpers

  # Boiler Plate
  # set mutation_type
  # set input_type if_any
  # set mutation keys ( the ones that get returned)
  # set variables *default
  # set user

  let(:mutation_type) { "createAcquiredCertification" }

  subject(:create_acquired_certification) do
    mutation(mutation_string, variables: variables, context: { current_user: user })
    raise GraphQL::TestHelpers::GraphqlException, gql_response if gql_response.errors
    gql_response.data[mutation_type].deep_symbolize_keys
  end

  let(:variables) { { acquiredCertificationInput: {} } }
  let(:mutation_keys) { "acquiredCertification { id acquiredOn }" }
  let(:mutation_string) do
    <<-GQL
          mutation #{mutation_type}($acquiredCertificationInput: AcquiredCertificationInputType!) {
                   #{mutation_type}(acquiredCertificationInput: $acquiredCertificationInput) {
                   #{mutation_keys}}}
    GQL
  end

  let(:user) { create(:user) }
  let(:certification) { create(:certification) }

  context "a user adds an acquired certification" do
    let(:variables) do
      { acquiredCertificationInput: {
        acquiredOn: 100.days.ago.to_s,
        certificationId: certification.id,
        ceus: 1,
        expires: true,
        expiresOn: 100.days.from_now.to_s,
        number: 1234,
        state: "NJ",
      } }
    end

    it { is_expected.to include(acquiredCertification: { acquiredOn: be_a_kind_of(String), id: be_a_kind_of(String) }) }
  end
end

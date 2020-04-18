## frozen_string_literal: true
##
# frozen_string_literal: true
require 'rails_helper'
require_relative '../../test_helpers'

describe Mutations::DeleteAcquiredCertification, type: :mutations do
  include GraphQL::TestHelpers

  # Boiler Plate
  # set mutation_type
  # set input_type if_any
  # set mutation keys ( the ones that get returned)
  # set variables *default
  # set user

  let(:mutation_type) { "deleteAcquiredCertification" }

  subject(:Delete_acquired_certification) do
    mutation(mutation_string, variables: variables, context: { current_user: user })
    raise GraphQL::TestHelpers::GraphqlException, gql_response if gql_response.errors
    gql_response.data[mutation_type].deep_symbolize_keys.dig(:success)
  end

  let(:variables) { { id: 0 } }
  let(:mutation_keys) { "success" }
  let(:mutation_string) do
    <<-GQL
          mutation #{mutation_type}($id: ID!) {
                   #{mutation_type}(id: $id) {
                   #{mutation_keys}}}
    GQL
  end

  let(:user) { create(:user) }
  let(:certification) { create(:certification) }
  let(:acquired_certification) { create(:acquired_certification, user: user, certification: certification) }

  context "a user adds an acquired certification" do
    let(:variables) { { id: acquired_certification.id } }

    it { is_expected.to be true }
  end
end

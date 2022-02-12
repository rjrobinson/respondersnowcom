## frozen_string_literal: true
##
# frozen_string_literal: true

require "rails_helper"
require_relative "../../test_helpers"

describe Mutations::UpdateAcquiredCertification, type: :mutations do
  include GraphQL::TestHelpers

  # Boiler Plate
  # set mutation_type
  # set input_type if_any
  # set mutation keys ( the ones that get returned)
  # set variables *default
  # set user

  subject(:update_acquired_certification) do
    mutation(mutation_string, variables: variables, context: { current_user: user })
    raise GraphQL::TestHelpers::GraphqlException, gql_response if gql_response.errors

    gql_response.data[mutation_type].deep_symbolize_keys
  end

  let(:mutation_type) { "updateAcquiredCertification" }
  let(:variables) { { acquiredCertificationInput: {} } }
  let(:mutation_keys) { "acquiredCertification { id acquiredOn expires expiresOn }" }
  let(:mutation_string) do
    <<-GQL
          mutation #{mutation_type}($acquiredCertificationInput: AcquiredCertificationInputType!) {
                   #{mutation_type}(acquiredCertificationInput: $acquiredCertificationInput) {
                   #{mutation_keys}}}
    GQL
  end
  let!(:acquired_certification) { create(:acquired_certification) }
  let(:user) { acquired_certification.user }
  let(:new_expire_dt) { 100.days.from_now.to_s }

  context "a user updates an acquired certification" do
    let(:variables) do
      { acquiredCertificationInput: {
        id: acquired_certification.id,
        expires: true,
        expires_on: new_expire_dt,
        ceus: 2
      } }
    end

    it do
      expect(subject).to include(acquiredCertification: { id: acquired_certification.id,
                                                          acquiredOn: be_a_kind_of(String),
                                                          expires: true,
                                                          expiresOn: be_a_kind_of(String) })
    end
  end
end

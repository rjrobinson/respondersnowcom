# frozen_string_literal: true
require 'rails_helper'
require_relative '../../test_helpers'

RSpec.describe Mutations::IncidentUpvote, type: :mutation do
  include GraphQL::TestHelpers

  describe "Incident Upvote" do

    subject(:incident_upvote) do
      mutation(query_string, variables: variables, context: { current_user: user, })
      raise GraphQL::TestHelpers::GraphqlException, gql_response if gql_response.errors

      gql_response.data["incidentUpVote"].deep_symbolize_keys.dig(:incident, :upvotes)
    end


    let(:variables) { { id: 0 } }
    let(:incident_keys) { "incident { id upvotes errors { fieldName errors } message confirmed }" }
    let(:query_string) { "mutation UpVoteIncident($id: ID!) { incidentUpVote(id: $id) {  #{incident_keys} } }" }

    let(:incident) { create(:incident) }
    let(:user) { create(:user) }

    context "when a user upvotes" do
      let(:variables) { { id: incident.id } }

      it { is_expected.to eq 1 }
    end

    let(:incident) { create(:incident) }

    context "when a user upvotes has already upvoted" do
      let(:variables) { { id: incident.id } }

      it { is_expected.to eq 1 }
    end


  end
  describe "Incident Downvote" do

    subject(:incident_downvote) do
      mutation(query_string, variables: variables, context: { current_user: user, })
      raise GraphQL::TestHelpers::GraphqlException, gql_response if gql_response.errors

      gql_response.data["incidentDownVote"].deep_symbolize_keys.dig(:incident, :downvotes)
    end


    let(:variables) { { id: 0 } }
    let(:incident_keys) { "incident { id downvotes errors { fieldName errors } message confirmed }" }
    let(:query_string) { "mutation DownVoteIncident($id: ID!) { incidentDownVote(id: $id) {  #{incident_keys} } }" }

    let(:incident) { create(:incident) }
    let(:user) { create(:user) }

    context "when a user downvotes" do
      let(:variables) { { id: incident.id } }

      it { is_expected.to eq 1 }
    end

    let(:incident) { create(:incident) }

    context "when a user dopwnvotes has already upvoted" do
      let(:variables) { { id: incident.id } }

      it { is_expected.to eq 1 }
    end


  end

end
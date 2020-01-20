require 'rails_helper'
require_relative '../../test_helpers'

include GraphQL::TestHelpers

describe 'CreateAcquiredCertification', type: :mutation do
  describe 'Acquired Certification creation for a user' do

    let(:user) { create(:user) }
    let(:mutation_type) { 'createAcquiredCertification' }
    let(:mutation_string) { <<-GQL
    mutation createAcquiredCertification($acquiredCertificationInput: AcquiredCertificationInputType!) {
      createAcquiredCertification(acquiredCertificationInput: $acquiredCertificationInput) {
        acquiredCertification {
          id
          acquiredOn
        }
       }
    }

    GQL
    }

    context 'when a user has all the required permissions and parameters' do

      before do
        mutation mutation_string,
                 variables: {
                     acquiredCertificationInput: {
                         acquiredOn: 100.days.ago.to_s,
                         certificationId: 1,
                         ceus: 1,
                         expires: true,
                         expiresOn: 100.days.from_now.to_s,
                         number: 1234,
                         state: "NJ"

                     }
                 },
                 context: {current_user: user}

      end

      it 'should return no errors' do
        expect(gql_response.errors).to be_nil
      end

      it 'should return the created acquired certification' do
        expect(gql_response.data[mutation_type].dig("acquiredCertification")).to include({"id" => be_a_kind_of(String)})
      end
    end

    context 'when a user is missing some data' do

      before do
        mutation mutation_string,
                 variables: {},
                 context: {current_user: user}

      end

      it 'should return errors' do
        expect(gql_response.errors).to_not be_nil
      end

    end
  end
end
# frozen_string_literal: true
# require 'rails_helper'
# require_relative '../test_helpers'
# include GraphQL::TestHelpers
#
# describe 'CreateBook', type: :mutation do
#  describe 'Creating a Book' do
#
#    let(:user) { build_stubbed(:user) }
#    let(:mutation_type) { "createBook" }
#    let(:mutation_string) { << -GQL
#    mutation createBook($bookInput : BookInputType!){
#        createBook(bookInput: $bookInput) {
#          book {
#            title
#            author
#            pages
#          }
#        }
#    }
#    GQL
#    }
#
#    context 'when a user has all the required permissions and parameters' do
#
#      before do
#        mutation mutation_string,
#                 variables: {
#                     bookInputType: {
#                         title:  "Testing GraphQL-Ruby Mutations With RSpec",
#                         author: "me",
#                         pages:  1
#                     }
#                 }
#        },
#            context : {current_user: user}
#      end
#
#      it 'should return no errors' do
#        expect(gql_response.errors).to be_nil
#      end
#
#      it 'should return the book object' do
#        expect(gql_response.data[mutation_type]["book"]).to include("title" => "Testing GraphQL-Ruby Mutations With RSpec")
#      end
#    end
#
#    context 'when a user has not passed required parameters parameters' do
#
#      before do
#        mutation mutation_string,
#                 variables: {
#                     bookInputType: {
#                         title: "Testing GraphQL-Ruby Mutations With RSpec",
#                     }
#                 }
#        },
#            context : {current_user: user}
#      end
#
#      it 'should return errors' do
#        expect(gql_response.errors).to be_truthy
#      end
#
#    end
#  end
# end

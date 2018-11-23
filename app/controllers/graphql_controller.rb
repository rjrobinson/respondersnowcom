# frozen_string_literal: true

class GraphqlController < ApplicationController
  skip_before_action :verify_authenticity_token, :authenticate_user!

  before_action :set_test_user

  def execute
    variables = ensure_hash(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = {
        # Query context goes here, for example:
        current_user: @current_user,
    }
    result = ResnowSchema.execute(document: get_document(query), variables: variables, context: context, operation_name: operation_name)
    render json: result
  rescue => e
    raise e unless Rails.env.development?
    handle_error_in_development e
  end

  private

    def get_document(query_string)
      cache_key = Base64.encode64(query_string)
      document = Rails.cache.fetch(cache_key)

      if document
        logger.info "###############################"
        logger.info "Got cached document #{document}"
        logger.info "###############################"
      else
        logger.info "####################################"
        logger.info "Parsing query string #{query_string}"
        logger.info "Cached at key #{cache_key}"
        logger.info "####################################"

        document = GraphQL.parse(query_string)
        Rails.cache.write(cache_key, document)
      end

      document
    end

    # Handle form data, JSON body, or a blank value
    def ensure_hash(ambiguous_param)
      case ambiguous_param
      when String
        if ambiguous_param.present?
          ensure_hash(JSON.parse(ambiguous_param))
        else
          {}
        end
      when Hash, ActionController::Parameters
        ambiguous_param
      when nil
        {}
      else
        raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
      end
    end

    def handle_error_in_development(e)
      logger.error e.message
      logger.error e.backtrace.join("\n")

      render json: { error: { message: e.message, backtrace: e.backtrace }, data: {} }, status: 500
    end


  private

    def set_test_user
      @current_user ||= User.first
    end
end

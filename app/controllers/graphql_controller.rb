# frozen_string_literal: true

class GraphqlController < ApplicationController
  def execute
    gql_variables = ensure_hash(params[:variables])
    gql_query = params[:query]
    gql_operation_name = params[:operationName]
    context = {
      request: request,
      current_user: current_user
    }
    result = KittynewsSchema.execute(gql_query, variables: gql_variables, context: context,
                                                operation_name: gql_operation_name)
    render json: result
  rescue StandardError => e
    raise e unless Rails.env.development?

    handle_error_in_development e
  end

  private

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

  def handle_error_in_development(error)
    logger.error error.message
    logger.error error.backtrace.join("\n")

    render json: { error: { message: error.message, backtrace: error.backtrace }, data: {} },
           status: :internal_server_error
  end
end

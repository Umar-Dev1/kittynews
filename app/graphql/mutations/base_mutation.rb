# frozen_string_literal: true

module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
    def require_current_user!
      raise GraphQL::ExecutionError, 'current user is missing' if context[:current_user].nil?
    end
  end
end

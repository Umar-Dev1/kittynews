# frozen_string_literal: true

module Mutations
  class VoteMutation < Mutations::BaseMutation
    argument :post_id, String, required: true

    field :is_voted, Boolean, null: true
    field :errors, String, null: true

    def resolve(post_id:)
      require_current_user!

      vote = Vote.find_by(post_id: post_id, user_id: context[:current_user].id)

      if vote
        vote.destroy!
        { is_voted: false }
      else
        Vote.create!(post_id: post_id, user_id: context[:current_user].id)
        { is_voted: true }
      end
    rescue GraphQL::ExecutionError => e
      { errors: Array(e.message) }
    rescue ActiveRecord::ActiveRecordError => e
      { errors: e.record.errors.full_messages }
    end
  end
end

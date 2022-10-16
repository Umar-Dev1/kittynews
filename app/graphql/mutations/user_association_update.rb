# frozen_string_literal: true

module Mutations
  class UserAssociationUpdate < Mutations::BaseMutation
    argument :user_id, String, required: false

    field :is_following, Boolean, null: true
    field :errors, String, null: true

    def resolve(user_id:)
      require_current_user!

      followee = context[:current_user]
      user = User.find_by(id: user_id)

      return {is_following: false, errors: 'Cannot follow'} if followee.id == user.id

      user_association = UserAssociation.find_by(following_user_id: followee.id)

      if user_association
        user_association.destroy!
        { is_following: false }
      else
        UserAssociation.create(followed_by_user: user, following_user: followee)
        { is_following: true }
      end
    rescue GraphQL::ExecutionError => e
      { errors: Array(e.message) }
    rescue ActiveRecord::ActiveRecordError => e
      { errors: e.record.errors.full_messages }
    end
  end
end

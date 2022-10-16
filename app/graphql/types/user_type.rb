# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :is_following, Boolean, null: false

    def is_following
      return false unless context.current_user

      object.followee_ids.include?(context.current_user.id)  
    end
  end
end

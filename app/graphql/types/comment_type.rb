# frozen_string_literal: true

module Types
  class CommentType < Types::BaseObject
    field :id, ID, null: false
    field :body, String, null: false
    field :user, UserType, null: false
    field :created_at, String, null: false
  end
end

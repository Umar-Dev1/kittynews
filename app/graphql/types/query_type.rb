# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :posts, [PostType], null: false

    field :post, PostType, null: false do
      description 'Find a post by id'
      argument :post_id, String, required: true
    end

    field :viewer, ViewerType, null: true

    field :user, UserType, null: false do
      description 'Find a user by id'
      argument :user_id, String, required: true
    end

    def posts
      Post.reverse_chronological.all
    end

    def viewer
      context.current_user
    end

    def post(post_id:)
      Post.find(post_id)
    end

    def user(user_id:)
      User.find(user_id)
    end
  end
end

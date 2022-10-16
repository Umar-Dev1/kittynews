# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :user_update, mutation: Mutations::UserUpdate
    field :user_association_update, mutation: Mutations::UserAssociationUpdate
    field :vote_mutation, mutation: Mutations::VoteMutation
  end
end

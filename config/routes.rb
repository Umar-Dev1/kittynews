# frozen_string_literal: true

Rails.application.routes.draw do
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?

  post '/graphql', to: 'graphql#execute'

  devise_for :users

  resources :users, only: [:show]
  resources :posts, only: %(show)

  root to: 'posts#index'
end

# frozen_string_literal: true

# == Route Map
#

Rails.application.routes.draw do
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?
  post '/graphql', to: 'graphql#execute'
  get 'home/index'

  root to: 'articles#index'
  resources :articles do
    resource :bookmarks, only: %i[create destroy]
    resource :likes, only: %i[create destroy]
  end
end

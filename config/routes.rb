# frozen_string_literal: true

# == Route Map
#

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?
  post '/graphql', to: 'graphql#execute'
  get 'home/index' => 'home#index'

  root to: 'articles#index'
  resources :articles do
    resource :bookmarks, only: %i[create destroy]
    resource :likes, only: %i[create destroy]
  end

  resources :applicants
  resources :users

  get '/auth/auth0/callback' => 'auth0#callback'
  get '/auth/failure' => 'auth0#failure'
  get '/auth/logout' => 'auth0#logout', as: :log_out
end

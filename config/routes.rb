# frozen_string_literal: true

# == Route Map
#

Rails.application.routes.draw do
  get 'switch_locale/:locale', to: 'application#switch_locale', as: :switch_locale
  post 'open_ai/submit'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'articles#index'
  resources :articles do
    resource :bookmarks, only: %i[create destroy]
    resource :likes, only: %i[create destroy]
  end

  resources :applicants
  resources :users

  get '/auth/auth0/callback' => 'auth0#callback'
  get '/auth/failure' => 'auth0#failure', as: :failure
  get '/auth/logout' => 'auth0#logout', as: :log_out
end

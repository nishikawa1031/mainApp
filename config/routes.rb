# frozen_string_literal: true

Rails.application.routes.draw do
  get 'google_login_api/callback'
  root to: 'articles#index'
  resources :articles do
    resource :bookmarks, only: %i[create destroy]
    resource :likes, only: %i[create destroy]
  end
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  scope 'users/:username' do
    get '/' => 'users#show', as: :user
  end

  post '/google_login_api/callback', to: 'google_login_api#callback'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

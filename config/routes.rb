# frozen_string_literal: true

# == Route Map
#

Rails.application.routes.draw do
  get 'google_login_api/callback'
  root to: 'articles#index'
  resources :articles do
    resource :bookmarks, only: %i[create destroy]
    resource :likes, only: %i[create destroy]
  end

  post '/google_login_api/callback', to: 'google_login_api#callback'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :subjects, only: %i[show] do
    resources :years, only: %i[show] do
      post '/questions/:id', to: 'questions#check'
      resources :questions, only: %i[show]
      # 例 http://localhost:3000/subjects/1/years/2022/questions/2
    end
  end
end

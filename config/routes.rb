# frozen_string_literal: true

# == Route Map
#

Rails.application.routes.draw do
  get 'home/index'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'log_out', to: 'sessions#destroy', as: 'log_out'

  resources :sessions, only: %i[create destroy]
  get 'google_login_api/callback'
  root to: 'articles#index'
  resources :articles do
    resource :bookmarks, only: %i[create destroy]
    resource :likes, only: %i[create destroy]
  end
  # https://github.com/omniauth/omniauth#integrating-omniauth-into-your-application
  post '/auth/:provider/callback', to: 'sessions#create'

  resources :subjects, only: %i[show] do
    resources :years, only: %i[show] do
      post '/questions/:id', to: 'questions#check'
      resources :questions, only: %i[show]
      # 例 http://localhost:3000/subjects/1/years/2022/questions/2
    end
  end
end

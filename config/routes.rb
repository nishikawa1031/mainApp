Rails.application.routes.draw do
  root to: 'articles#index'
  resources :articles do
    resource :bookmarks, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
  end
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  scope "users/:username" do
    get "/" => "users#show", as: :user
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

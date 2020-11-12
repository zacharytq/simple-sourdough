Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "static#home"
  delete "/session" => "sessions#destroy"
  resources :users, only: [:new, :create, :show]
  resources :formulas
  resources :users, only: [:show] do
    resources :formulas, only: [:index]
  end
  resources :formulas, only: [:show] do
    resources :bakes, only: [:show]
  end
  resources :bakes, only: [:show, :create, :index, :update, :edit]
  get '/login' => "sessions#login"
  resources :sessions, only: [:create]
  get 'auth/facebook', as: 'github_login'
  get '/auth/facebook/callback', to: 'sessions#create'
end

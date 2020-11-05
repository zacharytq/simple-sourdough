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
  resources :bakes, only: [:create]
  get '/login' => "session#login"
  resources :sessions, only: [:create]
end

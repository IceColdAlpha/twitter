Twitter::Application.routes.draw do
  resources :favorites

  resources :tweets
  resources :home

  get "login" => "sessions#new", as: "login"
  post "login" => "sessions#create"
  get "logout" => "sessions#destroy", as: "logout"
  
  resources :users
  #root to: "sessions#new"
  root to: "home#index"
  
end

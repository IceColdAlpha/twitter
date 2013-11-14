Twitter::Application.routes.draw do
  get "login" => "sessions#new", as: "login"
  post "login" => "sessions#create"
  get "logout" => "sessions#destroy", as: "logout"
  
  resources :users
  root to: "sessions#new"
  
end

Ticketee::Application.routes.draw do

  namespace :admin do
    root :to => "base#index"
    resources :users
  end

  root :to => "projects#index"

  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  resources :users

  resources :projects do
    resources :tickets 
  end

  resources :tickets do
    resources :comments
  end

end

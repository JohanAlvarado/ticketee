Ticketee::Application.routes.draw do

  root :to => "projects#index"

  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  resources :users

  resources :projects do
    resources :tickets 
  end
  resources :tickets do
    resources :comments
  end
end

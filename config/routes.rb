Ticketee::Application.routes.draw do

  root :to => "projects#index"

  resources :users

  resources :projects do
    resources :tickets 
  end
  resources :tickets do
    resources :comments
  end
end

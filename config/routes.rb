Ticketee::Application.routes.draw do


  root :to => "projects#index"

  namespace :admin do
    root :to => "base#index"
    resources :users
  end

  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  resources :users

  resources :projects do
    resources :tickets do
      collection do
        get :search
      end
    end
  end

  resources :tickets do
    resources :comments 
    resources :tags do
      member do
        delete :remove
      end
    end
  end

  namespace :api do
    namespace :v1 do
      resources :projects do
        resources :tickets
      end
    end
  end

end

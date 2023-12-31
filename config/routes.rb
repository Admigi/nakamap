Rails.application.routes.draw do
  get 'challenges/show'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :users
  resources :challenges do
    collection do
      get 'search'
    end
  end
  resources :bookmarks, only: [:create]
  resource :dashboards, only: [:show, :edit, :update]
  resources :pins, only: %i[index show], as: "map"
  resources :posts
  resources :challenges, only: %i[index show] do
    post 'check_answer', on: :member
  end
  resources :badges
  resources :userbadges
end

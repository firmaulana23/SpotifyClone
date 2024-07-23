Rails.application.routes.draw do
  get 'search/index'
  get 'home/index'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  
  # Artists routes
  resources :artists
  resources :albums
  resources :songs
  

  resources :songs, only: [] do
    resource :liked_song
  end

  # Playlists routes
  resources :playlists do
    resources :playlist_songs
  end

  resources :playlist

  root "home#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

Rails.application.routes.draw do
  get 'search/index'
  get 'home/index'
  
  devise_for :users, controllers: {
  sessions: 'users/sessions'
}
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  
  # Admin namespace
  namespace :admin do
    get 'dashboard/index'
    root "dashboard#index"  # Admin dashboard root
    resources :users
    resources :songs
    resources :artist_songs
    resources :artists
    resources :albums
    # Add more admin-specific routes here
  end

  # Client namespace
  namespace :client do
    root "dashboard#index"  # Client dashboard root
    resources :artists, only: [:index, :show]
    resources :albums, only: [:index, :show]
    resources :songs, only: [:index, :show]
    resources :playlists, only: [:index, :show, :create, :update, :destroy]
    resources :liked_songs, only: [:index]
    # Add more client-specific routes here
  end
  resources :users, only: [:show, :edit, :update]

  
  authenticated :user, -> user { user.admin? } do
    root to: 'admin/dashboard#index', as: :admin_root_path
  end
  
  authenticated :user do
    root to: 'client/dashboard#index', as: :client_root_path
  end
  
  # Define the fallback root path for unauthenticated users
  unauthenticated do
    root to: 'home#index'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

Rails.application.routes.draw do
  devise_for :users
  draw(:api)
  resources :songs do
    member do
      post 'play'
    end
  end
  resources :playlists do
    member do
      post 'add_song'
    end
  end
  
  get 'sessions' => 'sessions#index'
  # get 'auth/spotify', as: 'spotify_login', to: 'sessions#spotify_login'
  get '/auth/spotify/callback', to: 'sessions#spotify_callback'
  get '/auth/failure', to: 'sessions#failure'
  delete '/signout', to: 'sessions#destroy'

  resources :playlists do
    member do
      post 'add_song'
    end
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

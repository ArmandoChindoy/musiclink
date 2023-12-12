
namespace :api do
    namespace :v1 do
        resources :users, only: [:index, :show, :create, :update, :destroy]
        resources :playlists, only: [:index, :show, :create, :update, :destroy]
        resources :songs, only: [:index, :show, :create, :update, :destroy]
    end
end
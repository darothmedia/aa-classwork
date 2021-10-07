Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, except: [:new, :edit]

  resources :artworks, except: [:new, :edit] do
    resources :artwork_shares, only: :index
  end

  # /artworks/2/artwork_shares/

  resources :artwork_shares, only: [:create, :destroy]
end

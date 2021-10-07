Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, except: [:new, :edit] do 
    resources :artworks, only: :index
  end

  resources :artworks, except: [:index, :new, :edit]

  resources :comments, only: [:index, :create, :destroy]

  # /artworks/2/artwork_shares/

  resources :artwork_shares, only: [:create, :destroy]
end

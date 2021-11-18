Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    resources :benches, only: [:index, :create]
    resources :users
  end

  resource :session, only: [:create, :destroy]
  
  root to: "static_pages#root"

end

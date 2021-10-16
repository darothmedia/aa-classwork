Rails.application.routes.draw do
  resources :users
  resources :subs do
    resources :posts
  end
  resource :session, only: [:create, :destroy, :new]
end



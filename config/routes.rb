Rails.application.routes.draw do
  root to: 'home#index'
  
  devise_for :users
  
  resources :posts

  namespace :api do
    namespace :v1 do
      resources :posts
    end
  end
end

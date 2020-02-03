Rails.application.routes.draw do
  root to: 'home#index'
  
  devise_for :users

  resources :posts do
    post :create_comment, on: :member
  end
  
  namespace :api do
    namespace :v1 do
      resources :posts do
        post :create_comment, on: :member
      end
    end
  end
end

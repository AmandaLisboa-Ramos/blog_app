require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"
  
  devise_for :users
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  
  resources :posts do
    resources :comments, only: [:create]
  end
  resources :comments
  resources :post_tags
  
  root 'posts#index'

  get "up" => "rails/health#show", as: :rails_health_check
end

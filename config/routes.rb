Rails.application.routes.draw do
  resources :post_tags
  devise_for :users
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  resources :comments
  resources :posts do
    resources :comments, only: [:create]
  end
  
  root 'posts#index'

  get "up" => "rails/health#show", as: :rails_health_check
end

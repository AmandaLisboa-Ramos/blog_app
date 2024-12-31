Rails.application.routes.draw do
  # Rotas de autenticação do Devise
  devise_for :users
  
  # Definindo a raiz do aplicativo
  root 'posts#index'

  # Rotas para posts (index, show, new, create, edit, update, destroy)
  resources :posts do
    # Rotas para criar e destruir comentários dentro de posts
    resources :comments, only: [:create]
  end

  resources :comments

  # Rota de verificação de saúde do sistema
  get "up" => "rails/health#show", as: :rails_health_check

  # Outras rotas personalizadas aqui
  # Por exemplo, para PWA, se necessário:
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end

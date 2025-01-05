Sidekiq.configure_client do |config|
    config.redis = {
        url: Rails.application.credentials.config[:REDIS_URL],  # ou seu URL do Redis
        protocol: 3  # Usando o protocolo 3 para o Sidekiq
    }
  end
  
Sidekiq.configure_server do |config|
    config.redis = {
        url: Rails.application.credentials.config[:REDIS_URL],  # ou seu URL do Redis
        protocol: 3  # Usando o protocolo 1 para o Sidekiq
    }
end

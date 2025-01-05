Redis.current = Redis.new(
  url: Rails.application.credentials.config[:REDIS_URL] || "redis://localhost:6379",
  protocol: 2
)
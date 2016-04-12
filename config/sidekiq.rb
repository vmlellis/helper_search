ENV["REDIS_URL"] ||= "redis://#{ENV['REDIS_HOST']}:6379"

Sidekiq.configure_server do |config|
  config.redis = { url: ENV["REDIS_URL"], namespace: 'sidekiq' }
end

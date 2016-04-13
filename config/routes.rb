require 'sidekiq/web'

Sidekiq::Web.use Rack::Auth::Basic do |username, password|
  username == ENV['SIDEKIQ_USERNAME'] && password == ENV['SIDEKIQ_PASSWORD']
end if Rails.env.production?

Rails.application.routes.draw do
  resources :search_analytics
  resources :search_boxes

  mount Sidekiq::Web => '/sidekiq'
end

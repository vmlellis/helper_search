require 'sidekiq/web'

Sidekiq::Web.use Rack::Auth::Basic do |username, password|
  username == ENV['SIDEKIQ_USERNAME'] && password == ENV['SIDEKIQ_PASSWORD']
end if Rails.env.production?

Rails.application.routes.draw do
  root to: 'home#index'

  resources :search_analytics
  resources :search_boxes
  resources :home, only: [:index, :update]

  mount Sidekiq::Web => '/sidekiq'
end

require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  resources :blog_posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'blog_posts#index'
end

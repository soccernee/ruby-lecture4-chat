require 'sidekiq/web'

Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  mount Sidekiq::Web => '/sidekiq'

  delete 'logout' => 'users#logout'
  resources :users
  resources :rooms do
    resources :messages
  end
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

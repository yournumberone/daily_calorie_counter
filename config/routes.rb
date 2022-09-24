# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'products#index'
  resources :products
  resources :daily_diets do
    scope module: 'daily_diets' do
      resources :meals, only: %i[create destroy]
    end
  end

  mount Sidekiq::Web => '/sidekiq'
end

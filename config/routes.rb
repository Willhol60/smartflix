# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "shows#index"
  
  resources :shows do
    resource :stars, only: %w(update destroy)
  end
  
end

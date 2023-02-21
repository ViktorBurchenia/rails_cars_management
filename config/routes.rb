# frozen_string_literal: true

Rails.application.routes.draw do
  resources :cars
  devise_for :users
  # get 'welcome/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'welcome#index'
  get 'home', to: 'home#homepage'
  get 'help', to: 'home#help'
end

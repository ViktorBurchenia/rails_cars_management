
# frozen_string_literal: true

Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    resources :user_searches
    resources :cars 
    devise_for :users
    # get 'welcome/index'
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Defines the root path route ("/")
    root 'welcome#index'
    get 'home', to: 'home#homepage'
    get 'help', to: 'home#help' 
    get 'search', to: 'cars#search'
  end 
end 

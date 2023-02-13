Rails.application.routes.draw do
  devise_for :users
 # get 'welcome/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'welcome#index'
  get 'home', to: 'home#homepage'
  get 'help', to: 'home#help'
  get 'users/home', to: 'home#help' 
  get 'users/help', to: 'home#help' 
end

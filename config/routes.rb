Rails.application.routes.draw do
  devise_for :users
  get 'history/index'
  get 'pokemons/index'
  resources :pokemons, only: [:index]
  resources :search_histories, only: [:index]

  get 'weather', to: 'weather#index', as: 'weather'
  get 'weather/search', to: 'weather#search', as: 'weather_search'

  get 'pokemon', to: 'pokemons#index'
  get 'history', to: 'history#index'

  #get 'weather/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end

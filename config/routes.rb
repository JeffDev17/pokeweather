Rails.application.routes.draw do
  get 'user_pokemons/index'
  devise_for :users
  get 'history/index'
  get 'pokemons/index'
  resources :pokemons, only: [:index]
  resources :search_histories, only: [:index]

  get 'weather', to: 'weather#index', as: 'weather'
  get 'weather/search', to: 'weather#search', as: 'weather_search'

  get 'pokemon', to: 'pokemons#index'
  get 'history', to: 'history#index'
  resources :users, only: [] do
    resources :user_pokemons, only: [:index], as: 'collection'
  end
  #get 'weather/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end

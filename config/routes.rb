Rails.application.routes.draw do
  #get 'weather', to: 'weather#index', as: 'weather'
  get 'weather/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
# config/routes.rb
Rails.application.routes.draw do
  
  # other routes
end

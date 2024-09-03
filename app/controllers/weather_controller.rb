class WeatherController < ApplicationController
  def index
    @random_search = SearchHistory.all.sample
  end

  def search
    city = params[:city].capitalize
    weather_data = Search.new.run(city)
    
    display_results(weather_data)
    register_user_dex(weather_data)
  end

  private

  def display_results(weather_data)
    render turbo_stream:
      turbo_stream.replace("results", 
      partial: "shared/results", 
      locals: { weather_data: weather_data })
  end
  
  def register_user_dex(weather_data)  
    pokemon_name = weather_data[:pokemon]

    @pokemon = Pokemon.find_or_create_by(name: pokemon_name)
     current_user.user_pokemons.find_or_create_by(pokemon: @pokemon)

     #register.update
     
  end
end
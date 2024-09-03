class WeatherController < ApplicationController
  def index
    @random_search = SearchHistory.all.sample
    @random_pokemon = Pokemon.find_by(name: @random_search.pokemon)
  end

  def search
    city = params[:city].capitalize
    weather_data = Search.new.run(city)
    
    @random_pokemon = Pokemon.find_or_create_by(name: weather_data[:pokemon])
    
    display_results(weather_data)
    register_user_dex(weather_data)
  end

  private

  def display_results(weather_data)
    render turbo_stream:
      turbo_stream.replace("results", 
      partial: "shared/results", 
      locals: { weather_data: weather_data, random_pokemon: @random_pokemon })
  end
  
  def register_user_dex(weather_data)
    pokemon_name = weather_data[:pokemon]
    @pokemon = Pokemon.find_or_create_by(name: pokemon_name)
  
    user_pokemon = current_user.user_pokemons.find_or_create_by(pokemon: @pokemon)
  
    new_seen_count = (user_pokemon.seen || 0) + 1
    user_pokemon.update(seen: new_seen_count)
  end
end
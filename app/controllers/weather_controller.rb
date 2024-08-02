class WeatherController < ApplicationController
  def index
    @city = params[:city]
    if @city.present?
      weather_data = get_weather_for(@city)
      @temperature = weather_data[:temperature]
      @pokemon = select_pokemon_based_on_weather(@temperature)
    end
  end

  def search(city)
    # Replace this with actual API call and processing logic
    Search.new.run
  end

  private

  

  def select_pokemon_based_on_weather(temperature)
    # Logic to select a Pokémon based on temperature
    "Pikachu" # Example Pokémon
  end
end
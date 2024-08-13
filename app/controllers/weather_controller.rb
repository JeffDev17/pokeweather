class WeatherController < ApplicationController
  def index
    @random_search = SearchHistory.all.sample
  end

  def search
    city = params[:city].capitalize
    weather_data = Search.new.run(city)

    if weather_data.present?
      flash[:notice] = "City: #{weather_data[:city]}, Pokémon: #{weather_data[:pokemon]}, Temperature: #{weather_data[:temperature]}°C, Rain: #{weather_data[:rain] ? 'Yes' : 'No'}"
    else
      flash[:alert] = "City not found. Please try again."
    end

  end
end

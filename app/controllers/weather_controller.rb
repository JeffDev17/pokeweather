class WeatherController < ApplicationController
  def index
    @random_search = SearchHistory.all.sample
  end

  def search
    city = params[:city].capitalize
    weather_data = Search.new.run(city)
<<<<<<< HEAD
    
=======
>>>>>>> develop
    display_results(weather_data)
  end

  private

  def display_results(weather_data)
    render turbo_stream:
      turbo_stream.replace("results", 
      partial: "shared/results", 
      locals: { weather_data: weather_data })
  end
  
end

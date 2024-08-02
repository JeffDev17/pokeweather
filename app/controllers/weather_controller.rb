class WeatherController < ApplicationController
  def index
  end

  def search
    city = params[:city].capitalize
    Search.new.run(city)
    render :index
  end


end
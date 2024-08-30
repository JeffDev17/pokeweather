class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.order("#{sort_column} #{sort_direction}")
  end

  private

  def sort_column
    # Ensure the column being sorted is one of the allowed columns
    %w[dex name height weight].include?(params[:sort]) ? params[:sort] : "dex"
  end

  def sort_direction
    # Ensure the direction is either 'asc' or 'desc'
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end

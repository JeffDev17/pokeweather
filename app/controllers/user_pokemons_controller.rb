class UserPokemonsController < ApplicationController
  def index
    @user = current_user
    @pokemons = @user.user_pokemons
  end
end
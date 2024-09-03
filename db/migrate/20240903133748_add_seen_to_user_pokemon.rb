class AddSeenToUserPokemon < ActiveRecord::Migration[7.0]
  def change
    add_column :user_pokemons, :seen, :integer
  end
end

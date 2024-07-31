class AddDexToPokemon < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :dex, :integer
  end
end

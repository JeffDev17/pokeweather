class Pokemon < ApplicationRecord
  # Associations with PokemonType joint table
  has_many :pokemon_types
  has_many :types, through: :pokemon_types
  
  # conexao UserPokemons
  has_many :user_pokemons
  has_many :users, through: :user_pokemons

  #conexao Sprites usando ActiveStorage
  has_one_attached :sprite_image

end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

pokemon_types = [
    "Normal", "Fire", "Water", "Electric", "Grass", "Ice", 
    "Fighting", "Poison", "Ground", "Flying", "Psychic", 
    "Bug", "Rock", "Ghost", "Dragon", "Dark", "Steel", 
    "Fairy"
  ]
  
  # Populate the PokemonType table
  pokemon_types.each do |type_name|
    Type.find_or_create_by(name: type_name)
  end

#require 'rest-client'
#require 'json'

class PokemonApi

    def run
        response = RestClient.get("https://pokeapi.co/api/v2/pokemon/charizard")
        pokemon_data = JSON.parse(response)

        #type = pokemon_data['types'][0]['type']['name']
        #type2 = pokemon_data['types'][1]['type']['name']
        types = []


        pokemon_data['types'].each do |type|
            puts type['type']['name']
            types << type['type']['name']
        end

        name = pokemon_data['species']['name']
        puts "The pokémon is: #{name}"
        puts types

        types
    end

end
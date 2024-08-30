#require 'rest-client'
#require 'json'

class PokemonApi

    def run(type)
        
        response = RestClient.get("https://pokeapi.co/api/v2/type/#{type}")
        pokemon_data = JSON.parse(response)

        names_list = pokemon_data['pokemon'].map { |names| names['pokemon']['name'] }
    
        today = Date.today
        today_range = today.beginning_of_day..today.end_of_day
    
            random_pokemon = names_list.sample
            
            if SearchHistory.exists?(pokemon: random_pokemon, created_at: today_range)
              random_pokemon = names_list.sample
            end
            
            random_pokemon.to_s

    end

    def register(pokemon)
      response = RestClient.get("https://pokeapi.co/api/v2/pokemon/#{pokemon}/")
        pokemon_data = JSON.parse(response)
      
      pokemon_data

    end
end

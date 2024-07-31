#require 'rest-client'
#require 'json'

class PokemonApi

    def run(type)
        
        response = RestClient.get("https://pokeapi.co/api/v2/type/#{type}")
        pokemon_data = JSON.parse(response)

        names_list = []
        pokemon_selecionado = []

        pokemon_data['pokemon'].each do |names|
            names_list << names['pokemon']['name']
            end
            
            today_pokemons = SearchHistory.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).pluck(:pokemon)
            
            random_pokemon = names_list.sample

            if today_pokemons.include?(random_pokemon)
              random_pokemon = names_list.sample
            end

            pokemon_selecionado = random_pokemon.to_s
            
            pokemon_selecionado

    end

    def register(pokemon)
      response = RestClient.get("https://pokeapi.co/api/v2/pokemon/#{pokemon}/")
        pokemon_data = JSON.parse(response)
      
      pokemon_data

    end
end



            #remaining_pokemons = names_list - today_pokemons
            #random_pokemon = names_list[rand(names_list.length)]
            #while pokemon_selecionado.last == new_pokemon
            #  new_pokemon = remaining_pokemons[rand(remaining_pokemons.length)]
            #end
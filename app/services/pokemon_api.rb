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

        1.times do
            new_pokemon = names_list[rand(names_list.length)]
          
            while pokemon_selecionado.last == new_pokemon
              new_pokemon = names_list[rand(names_list.length)]
            end
          
            pokemon_selecionado << new_pokemon
          end


        #puts "O pokemon selecionado é: "
        pokemon_selecionado
    end

end
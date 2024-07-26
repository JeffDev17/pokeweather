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
        pokemon_selecionado << names_list[rand(names_list.length)]
        end

       
        #puts "O pokemon selecionado é: "
        pokemon_selecionado
    end

end
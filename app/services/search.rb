class Search 

    def run
        data = consult_weather
        temperature = data[0]
        rain = data[1]
        city = data[2]
        
        type = check_type(temperature, rain).downcase
  
        pokemon_selecionado = consult_pokemon(type)
        pokemon_selecionado.capitalize

        #Coloca o puts no console
        mostra_resultado(city, temperature, rain, pokemon_selecionado, type)

        #regitra no SearchHistory
        register(city, temperature, pokemon_selecionado.capitalize)
        
        #Monta o objeto pokemon (nome, altura, peso, dexNo, tipo)
        object = build_pokemon_object(pokemon_selecionado)

        
        pokemon = register_dex(object.first)

        create_pokemon_type(pokemon, object.last)
        

    end

    private  

    def mostra_resultado(city, temperature, rain, pokemon_selecionado, type)
      
      puts "A temperatura atual na cidade de #{city} é #{temperature}°C"
      
      if rain.eql?('Rain')
        puts "Atualmente está chovendo;"
      else
        puts "Não está chovendo."
      end

      puts "O pokemon selecionado para esta região foi: #{pokemon_selecionado} e o tipo é: #{type.capitalize}"

    end


    def check_type(temperature, rain)
        return 'Electric' if rain.eql?('Rain')

        case temperature
        when ..5
          'Ice'
        when 5...10
          'Water'
        when 12...15
          'Grass'
        when 15...21
          'Ground'
        when 23...27
          'Bug'
        when 27..33
          'Rock'
        when 33...
          'Fire'
        else
          'Normal'
        end
        
    end

    def consult_pokemon(type)
        PokemonApi.new.run(type)

    end

    def consult_weather
        WeatherApi.new.run
        
    end

    def register(city, temperature, pokemon_selecionado)
      SearchHistory.new(city: "#{city}", temperature: "#{temperature}", pokemon: "#{pokemon_selecionado}").save
      
    end

    def register_dex(object)
      #Vai buscar(find) o (object: name) 
      #na tabela de Pokemon
      #e se não encontrar na lista vai criar 
      #um pokemon usando os dados do Hash (object) 
      Pokemon.create_with(object).find_or_create_by(name: object[:name])
    end

    def build_pokemon_object(pokemon_selecionado)
      #Roda a API
      #Monta o pokemon retornando os dados num hash
      pokemon_data = PokemonApi.new.register(pokemon_selecionado)
     
      pokemon_object = {
        name: pokemon_data['name'].capitalize,
        dex: pokemon_data['id'],
        height: pokemon_data['height'],
        weight: pokemon_data['weight']
      }

      [pokemon_object, pokemon_data['types']]
    end

    def create_pokemon_type(pokemon, types)
      types.each do |type|
      type_seed = Type.find_by(name: type['type']['name'].capitalize)

      PokemonType.create!(pokemon: pokemon, type: type_seed)


      end


    end


end


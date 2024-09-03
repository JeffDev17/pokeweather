class Search 

  def run(city)
    data = consult_weather(city)
    temperature = data[0]
    rain = data[1]
    city = data[2]
    type = check_type(temperature, rain).downcase
  
    pokemon_selecionado = PokemonApi.new.run(type)
    pokemon_selecionado.capitalize!
  
    # Register in SearchHistory table
    register(city, temperature, pokemon_selecionado)
  
    # Build the Pokémon object (name, height, weight, dexNo, type)
    object, types = build_pokemon_object(pokemon_selecionado)
  
    # Register or find the Pokémon
    pokemon = register_dex(object)
  
    # Create Pokémon types
    create_pokemon_type(pokemon, types)
  
    # Attach the sprite image
    attach_sprite_image(pokemon, object[:sprite_image])
  
    # Return data for display
    weather_data = {
      pokemon: pokemon_selecionado,
      temperature: temperature,
      rain: rain,
      city: city
    }
    puts weather_data.inspect

    weather_data
  end

    private  

    def check_type(temperature, rain)
        return 'Electric' if rain.eql?('Rain')

        case temperature
            when -Float::INFINITY..5
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
            when 33..Float::INFINITY
              'Fire'
            else
              'Normal'
          end
    end

    def consult_pokemon(type)
        PokemonApi.new.run(type)

    end

    def consult_weather(city)
        WeatherApi.new.run(city)
        
    end

    def register(city, temperature, pokemon_selecionado)
      SearchHistory.new(city: "#{city}", temperature: "#{temperature}", pokemon: "#{pokemon_selecionado}").save
      
    end

    def register_dex(object)
      pokemon = Pokemon.find_or_create_by(name: object[:name])
    
      # organiza os attributos (remover????)
      pokemon.dex = object[:dex]
      pokemon.height = object[:height]
      pokemon.weight = object[:weight]
    
      # Cria o pokemon
      pokemon.save!
    
      # attach sprite separadamente
      if object[:sprite_image].present?
        attach_sprite_image(pokemon, object[:sprite_image])
      end
    
      pokemon
    end


    def build_pokemon_object(pokemon_selecionado)
      pokemon_data = PokemonApi.new.register(pokemon_selecionado)
    
      object = {
        name: pokemon_data['name'].capitalize,
        dex: pokemon_data['id'],
        height: pokemon_data['height'],
        weight: pokemon_data['weight'],
        sprite_image: pokemon_data.dig('sprites', 'other', 'official-artwork', 'front_default')
      }
    
      [object, pokemon_data['types']]
    end

    def create_pokemon_type(pokemon, types)
      types.each do |type|
      type_seed = Type.find_by(name: type['type']['name'].capitalize)
      PokemonType.create!(pokemon: pokemon, type: type_seed)
      end
    end

    def attach_sprite_image(pokemon, image_url)
      return unless image_url.present?

      image_data = RestClient.get(image_url)
      image_file = StringIO.new(image_data.body)
      
      pokemon.sprite_image.attach(io: image_file, filename: "#{pokemon.name.downcase}.png")
      pokemon.save
    end

end


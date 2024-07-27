class Search 

    def run
        data = consult_weather
        temperature = data[0]
        rain = data[1]
        city = data[2]
        
        type = check_type(temperature, rain)
  
        pokemon_selecionado = consult_pokemon(type)

        mostra_resultado(city, temperature, rain, pokemon_selecionado)

    end

    private  

    def mostra_resultado(city, temperature, rain, pokemon_selecionado)
      
      puts "A temperatura atual na cidade de #{city} é #{temperature}°C"
      
      if rain.eql?('Rain')
        puts "Atualmente está chovendo;"
      else
        puts "Não está chovendo."
      end

      puts "O pokemon selecionado para esta região foi: #{pokemon_selecionado}"

    end


    def check_type(temperature, rain)
        return 'electric' if rain.eql?('Rain')

        case temperature
        when ..5
          'ice'
        when 5...10
          'water'
        when 12...15
          'grass'
        when 15...21
          'ground'
        when 23...27
          'bug'
        when 27..33
          'rock'
        when 33...
          'fire'
        else
          'normal'
        end
        
    end

    def consult_pokemon(type)
        PokemonApi.new.run(type)

    end

    def consult_weather
        WeatherApi.new.run
        
    end

end


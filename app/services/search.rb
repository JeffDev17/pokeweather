class Search 

    def run
        data = consult_weather
        temperature = data[0]
        rain = data[1]
        city = data[2]
        
        type = check_type(temperature, rain).downcase
  
        pokemon_selecionado = consult_pokemon(type)
        pokemon_selecionado

        mostra_resultado(city, temperature, rain, pokemon_selecionado, type)

        register(city, temperature, pokemon_selecionado)
        

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


end


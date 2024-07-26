class WeatherApi

    def run    
        puts "Qual cidade você gostaria de pesquisar?"
        city = gets.chomp.to_s 

        api_key = 'bb60fe79dd6d01cf93722e71082e8701'
        
        response = RestClient.get("https://api.openweathermap.org/data/2.5/weather?q=#{city}&units=metric&appid=#{api_key}")
        weather_data = JSON.parse(response)
        weather_wrap = []

        temperature = weather_data['main']['temp']
        description = weather_data['weather'][0]['description']
        chuva = weather_data['weather'][0]['main']
        rain = chuva.to_s
        #puts "Current weather in #{city}:"
        #puts "Temperature: #{temperature} graus"
        #puts "Description: #{description}"
        
        return rain if rain.eql?('Rain')
        
        
        weather_wrap << temperature << rain << city
        
        weather_wrap
        
        
    end


end
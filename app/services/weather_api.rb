class WeatherApi

    def run(city)   
        api_key = 'insert key here'
        
        response = RestClient.get("https://api.openweathermap.org/data/2.5/weather?q=#{city}&lang=pt_br&units=metric&appid=#{api_key}")
        
        weather_data = JSON.parse(response)
        weather_wrap = []

        temperature = weather_data['main']['temp']
        description = weather_data['weather'][0]['description']
        chuva = weather_data['weather'][0]['main']
        rain = chuva.to_s
        
        return rain if rain.eql?('Rain')
        
        
        weather_wrap << temperature << rain << city
        
        weather_wrap
        
        
    end


end
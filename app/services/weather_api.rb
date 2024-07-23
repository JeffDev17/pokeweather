require 'rest-client'
require 'json'

puts "Qual cidade você gostaria de pesquisar?"
city = gets.chomp 

api_key = 'bb60fe79dd6d01cf93722e71082e8701'

response = RestClient.get("https://api.openweathermap.org/data/2.5/weather?q=#{city}&units=metric&appid=#{api_key}")
weather_data = JSON.parse(response)

temperature = weather_data['main']['temp']
description = weather_data['weather'][0]['description']
puts "Current weather in #{city}:"
puts "Temperature: #{temperature} graus"
puts "Description: #{description}"


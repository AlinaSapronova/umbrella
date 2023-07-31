require "http"

gmaps_key = ENV.fetch("GMAPS_KEY")
puts "Enter you location:"

user_location = gets.chomp

gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{user_location}&key=#{gmaps_key}"

raw_response = HTTP.get(gmaps_url)

require "json"

parsed_response = JSON.parse(raw_response)

results = parsed_response.fetch("results")
first_result = results.at(0)
geometry= first_result.fetch("geometry")
latitude = geometry.fetch("location").fetch("lat")
longitude = geometry.fetch("location").fetch("lng")

pp "Your latitude is #{latitude} and longitude #{longitude}"


pirate_key = ENV.fetch("PIRATE_WEATHER_KEY")
pirate_url = "https://api.pirateweather.net/forecast/#{pirate_key}/#{latitude},#{longitude}"

pirate_response = HTTP.get(pirate_url)

response = JSON.parse(pirate_response)

currently = response.fetch("currently")
#pp currently
temperature = currently.fetch("temperature")
summary = currently.fetch("summary")
pp "Temperature in #{user_location} is #{temperature} and it is #{summary}"

probability = currently.fetch("precipProbability")
pp probability

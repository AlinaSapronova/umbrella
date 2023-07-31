require "http"

gmaps_key = ENV.fetch("GMAPS_KEY")
puts "Enter you location:"

user_location = gets.chomp

gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{user_location}&key=#{gmaps_key}"

raw_response = HTTP.get(gmaps_url)

require "json"

parsed_response = JSON.parse(raw_response)

#pp "Weather in your location #{user_location}"
results = parsed_response.fetch("results")
#pp results
first_result = results.at(0)
geometry= first_result.fetch("geometry")
pp geometry
#pp "Your latitude is #{fetch.} and longitude"

require "http"

system clear

response = HTTP.get(https://data.cityofchicago.org/resource/xzkq-xp2w.json)

weather_data = response.parse(:json)

p weather_data             
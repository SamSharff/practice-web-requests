require "http"

system "clear"

puts "Please enter a word. I will return the definition. Type 'q' to quit."
word = gets.chomp

while true
  if word == "q".downcase
    break
  else
response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=***YOUR_API_KEY***")
definition = response.parse(:json)

response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/topExample?useCanonical=false&api_key=***YOUR_API_KEY***")
top_example = response.parse(:json)

response = HTTP.get("https://api.wordnik.com/v4/word.json/delicate/pronunciations?useCanonical=false&limit=50&api_key=***YOUR_API_KEY***")
top_pronunciation = response.parse(:json)
  end

pp definition
pp top_example
pp top_pronunciation
end
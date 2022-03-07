require "http"

system "clear"
puts "Welcome to amanda's neato dictionary app!"
print "Enter a word: "
input_word = gets.chomp

response = HTTP.get("https://api.wordnik.com/v4/word.json/#{input_word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=API-KEY")
definitions = response.parse(:json)

response = HTTP.get("https://api.wordnik.com/v4/word.json/#{input_word}/examples?includeDuplicates=false&useCanonical=false&limit=5&api_key=API-KEY")
top_example = response.parse(:json)

response = HTTP.get("https://api.wordnik.com/v4/word.json/#{input_word}/pronunciations?useCanonical=false&limit=50&api_key=API-KEY")
pronunciations = response.parse(:json)

puts "DEFINITIONS:"
index = 0
definitions.length.times do
  definition = definitions[index]
  puts "#{index + 1}. #{definition['text']}"
  puts
  index = index + 1
end
puts

puts "TOP EXAMPLE"
puts top_example["text"]
puts

puts "PRONUNCIATIONS"
index = 0
pronunciations.length.times do
  pronunciation = pronunciations[index]
  puts "#{index + 1}. #{pronunciation["raw"]}"
  index = index + 1
end

# bonus
response = HTTP.get("https://api.wordnik.com/v4/word.json/pineapple/audio?useCanonical=false&limit=50&api_key=API-KEY")
`open #{response.parse(:json)[0]['fileUrl']}`
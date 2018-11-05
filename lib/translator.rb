# require modules here
require 'pry'
require 'yaml'

def load_library(chase)
  #binding.pry
  YAML.load_file(chase)
  emotions = {'get_meaning' => {}, 'get_emoticon' => {} }
 YAML.load_file(chase).each do |meaning , emojis|
       emotions['get_emoticon'][emojis[0]] = emojis[1]
       emotions['get_meaning'][emojis[1]] = meaning


#binding.pry

  

end
emotions
end

def get_japanese_emoticon(chase, emoji)
  japanese_emoji = load_library(chase)
  YAML.load_file(chase).each do |meaning , emojis|
       emotions['get_emoticon'][emojis[0]] = emojis[1]
  
end
japanese_emoji
end

def get_english_meaning
  # code goes here
end
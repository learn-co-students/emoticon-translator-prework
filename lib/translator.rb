# require modules here
require 'yaml'
require "pry"

def load_library(path)
  emojis = YAML.load_file(path)
  emoji_hash = Hash.new
  emoji_hash["get_emoticon"] = Hash.new
  emoji_hash["get_meaning"] = Hash.new
  emojis.each do |english_word, emoji_array|
    emoji_hash["get_emoticon"][emoji_array.first] = emoji_array.last
    emoji_hash["get_meaning"][emoji_array.last] = english_word
  end
  emoji_hash
  
end


# def get_japanese_emoticon(path, emoticon)
#   # library.each do 
#     # binding.pry
# end

def get_japanese_emoticon(path, emoticon)
  emoticon_hash = load_library(path)
  result = emoticon_hash["get_emoticon"][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found" 
  end
  result
end

def get_english_meaning(path, emoticon)
  emoticon_hash = load_library(path)
  result = emoticon_hash["get_meaning"][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found" 
  end
  result
end
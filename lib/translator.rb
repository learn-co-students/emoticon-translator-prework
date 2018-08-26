# require modules here

require 'yaml'

def load_library(library)
  # code goes here
  emoticons = YAML.load_file(library)
  emoticon_hash = Hash.new

  emoticon_hash["get_meaning"] = Hash.new
  emoticon_hash["get_emoticon"] = Hash.new

  emoticons.each do |english_meaning, emoticon_list|
    emoticon_hash["get_meaning"][emoticon_list.last] = english_meaning
    emoticon_hash["get_emoticon"][emoticon_list.first] = emoticon_list.last
end
emoticon_hash
end

def get_japanese_emoticon(path, emoticon)
  #code goes here
  emoticons = load_library(path)
  input = emoticons["get_emoticon"][emoticon]
  if input == nil
    return "Sorry, that emoticon was not found"
  else
  end
return input
end

def get_english_meaning(path, emoticon)
  # code goes here
  emoticons = load_library(path)
  input = emoticons["get_meaning"][emoticon]
  if input == nil
    return "Sorry, that emoticon was not found"
  else
  end
return input
end

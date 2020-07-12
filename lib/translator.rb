# require modules here
require "yaml"
require 'pry'

def load_library (file_path)
  # code goes here
  emoticons = YAML.load_file(file_path)
  library = {}
  library["get_meaning"] = {}
  library["get_emoticon"] = {}
  emoticons.each do |meaning, emojis|
    library["get_meaning"][emojis[1]] = meaning
    library["get_emoticon"][emojis[0]] = emojis[1]
    end 
  library
end

def get_japanese_emoticon(file_path, emoji)
  library = load_library(file_path)
  if !library["get_emoticon"].has_key?(emoji)
    return "Sorry, that emoticon was not found"
  else 
  library["get_emoticon"][emoji]
  # code goes here
end 
end

def get_english_meaning(file_path, emoji)
  # code goes here
    library = load_library(file_path)
  if !library["get_meaning"].has_key?(emoji)
    return "Sorry, that emoticon was not found"
  else 
  library["get_meaning"][emoji]
  # code goes here
end 
end
require "yaml"
require 'pry'

def load_library(path)
  emoticons = YAML.load_file(path)
  new_hash = {}
  
  emoticons.each do |emotion, array|
    new_hash["get_meaning"] ||= {}
    new_hash["get_emoticon"] ||= {}
    new_hash["get_meaning"][array.last] ||= emotion
    new_hash["get_emoticon"][array.first] ||= array.last
  end 
  new_hash
end

def get_japanese_emoticon(path, emoticon)
  lib_hash = load_library(path)
  dictionary = lib_hash['get_emoticon']
  if dictionary.has_key?(emoticon)
    dictionary[emoticon]
  else 
    "Sorry, that emoticon was not found"
  end 
end

def get_english_meaning(path, emoticon)
  lib_hash = load_library(path)
  dictionary = lib_hash['get_meaning']
  if dictionary.has_key?(emoticon)
    dictionary[emoticon]
  else 
    "Sorry, that emoticon was not found"
  end 
end
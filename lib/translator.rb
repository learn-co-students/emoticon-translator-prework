# require modules here
require "pry"
require "yaml"

def load_library(lib)
  # code goes here
  newHash = {}
  newHash['get_meaning'] = {}
  newHash['get_emoticon'] = {}
  library = YAML.load_file(lib)
  for n in library
      newHash['get_meaning'][n[1][1]] = n[0]
      newHash['get_emoticon'][n[1][0]] = n[1][1]
      #binding.pry
  end

  newHash
end

def get_japanese_emoticon(lib,emot)
  # code goes here
  emotHash = load_library(lib)
  result = emotHash["get_emoticon"][emot]
  if result == nil
    result = "Sorry, that emoticon was not found"
  end
  result
end

def get_english_meaning(lib,jEmot)
  emotHash = load_library(lib)
  #binding.pry
  result = emotHash["get_meaning"][jEmot]
  if result == nil
    result = "Sorry, that emoticon was not found"
  end
  result
end

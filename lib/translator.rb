# require modules here
require 'yaml'
require 'pry'

def load_library(path)
  # code goes here
  lib = YAML.load_file(path)
  # binding.pry
  result = {}

  lib.each do |name, emoticons|
    result['get_meaning'] ||= {}
    result['get_meaning'][emoticons[1]] = name
    result['get_emoticon'] ||= {}
    result['get_emoticon'][emoticons[0]] = emoticons[1]
    # binding.pry
  end

  result
  # binding.pry
end

def get_japanese_emoticon(path, emoticon)
  # code goes here
  table = load_library(path)
  result = table['get_emoticon'][emoticon]

  found?(result)
end

def get_english_meaning(path, emoticon)
  # code goes here
  table = load_library(path)
  result = table['get_meaning'][emoticon]

  found?(result)
end

def found?(x)
  if !x
    "Sorry, that emoticon was not found"
  else
    x
  end
end

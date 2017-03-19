# require modules here
require "pry"
require "yaml"
def load_library(emoticons)
  # code goes here
  emoticons = YAML.load_file('./lib/emoticons.yml')
  new_emoticons = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  emoticons.each do |expression, symbol|
    new_emoticons["get_meaning"][symbol.last] = expression
    new_emoticons["get_emoticon"][symbol.first] = symbol.last
  end
  new_emoticons
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  hash = load_library(file_path)
  if hash["get_emoticon"][emoticon]
    hash["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  hash = load_library(file_path)
  if hash["get_meaning"][emoticon]
    hash["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

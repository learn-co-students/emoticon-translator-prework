# require modules here
require "pry"
require "yaml"

def load_library(path)
  # code goes here
  emoticons = YAML.load_file(path) #this method is loading a the YAML, so it's taking the path argument and passing it through
  library = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticons.each do |key, value|
    library["get_meaning"][value[1]] = key
    library["get_emoticon"][value[0]] = value[1]
  end
  library
end

def get_japanese_emoticon(path, emoticon)
  # code goes here
  answer = ""
  library = load_library(path)
  if library["get_emoticon"].include?(emoticon)
    answer = library["get_emoticon"][emoticon]
  else
    answer = "Sorry, that emoticon was not found"
  end
  answer
end

def get_english_meaning(path, emoticon)
  # code goes here
  library = load_library(path)
  if library["get_meaning"].include?(emoticon)
    answer = library["get_meaning"][emoticon]
  else
    answer = "Sorry, that emoticon was not found"
  end
  answer
end

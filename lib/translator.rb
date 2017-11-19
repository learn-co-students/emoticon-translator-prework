# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  # code goes here
  library = {"get_meaning" => {}, "get_emoticon" => {}}
  YAML.load_file(file_path).each do |meaning, array|
    english, japanese = array
    library["get_emoticon"][english] = japanese
    library["get_meaning"][japanese] = meaning
  end
  library
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  library = load_library(file_path)

  if library["get_emoticon"][emoticon]
    library["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  library = load_library(file_path)


  if library["get_meaning"][emoticon]
     library["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

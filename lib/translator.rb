# require modules here
require 'yaml'

def load_library(file_path)
  # code goes here
  yaml_file = YAML.load_file(file_path)
  library = {"get_meaning" => {}, "get_emoticon" => {}}
  yaml_file.each{|meaning, emoticons|
    library["get_meaning"][emoticons[1]] = meaning.to_s
    library["get_emoticon"][emoticons[0]] = emoticons[1]
  }
  library
end

def get_japanese_emoticon(file_path,emoticon)
  # code goes here
  library = load_library(file_path)
  if library["get_emoticon"].include?(emoticon)
    library["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path,emoticon)
  # code goes here
  library = load_library(file_path)
  if library["get_meaning"].include?(emoticon)
    library["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

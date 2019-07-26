# require modules here
require "pry"
require "yaml"


def load_library(file)
  library = {}
  emojipedia = YAML.load_file(file)
  emojipedia.each do |meaning, emoticon|
    library["get_meaning"] ||= {}
    library["get_meaning"][emoticon[1]] = meaning 
    library["get_emoticon"] ||= {}
    library["get_emoticon"][emoticon[0]] = emoticon[1]
  end
  library 
end

def get_japanese_emoticon(file, emoticon)
  translation = load_library(file)
  search = translation["get_emoticon"][emoticon]
  
  if !search
    "Sorry, that emoticon was not found"
  else
    search
  end
  
  # code goes here
end

def get_english_meaning(file,emoticon)
  translation = load_library(file)
  search = translation["get_meaning"][emoticon]
  
  if !search
    "Sorry, that emoticon was not found"
  else
    search
  end
end
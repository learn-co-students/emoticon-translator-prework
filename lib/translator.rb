# require modules here
require "yaml"
require "pry"

def load_library(file)
  # code goes here
  new_hash = {
    "get_meaning" => {},
    "get_emoticon" => {}
}
  YAML.load_file(file).each do |key,value|
    new_hash["get_meaning"][value[1]] = key
    new_hash["get_emoticon"][value[0]] = value[1]
  end

  new_hash
end

def get_japanese_emoticon(file, emoticon)
  # code goes here
  emote_hash = load_library(file)
  dictionary = emote_hash["get_emoticon"]

  if dictionary.has_key?(emoticon)
    dictionary[emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, emoticon)
  # code goes here
  emote_hash = load_library(file)
  dictionary = emote_hash["get_meaning"]

  if dictionary.has_key?(emoticon)
    dictionary[emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

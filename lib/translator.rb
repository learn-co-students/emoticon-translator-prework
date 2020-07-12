require 'yaml'
require 'pry'

# file_path = YAML.load_file('./lib/emoticons.yml')

def load_library(file_path)
  library = YAML.load_file(file_path)

  emoticon_hash = {}
  emoticon_hash["get_meaning"] = {}
  emoticon_hash["get_emoticon"] = {}

  library.each do |english_word, emoticon_symbols|
    emoticon_hash["get_meaning"][emoticon_symbols[1]] = english_word
    emoticon_hash["get_emoticon"][emoticon_symbols[0]] = emoticon_symbols[1]
    # binding.pry
  end
  emoticon_hash
end

def get_japanese_emoticon(file_path, english_emoticon)
  emoticons = load_library(file_path)
  dictionary = emoticons["get_emoticon"]
  if dictionary.include?(english_emoticon)
    dictionary[english_emoticon]
  else
    "Sorry, that emoticon was not found"
  end
  # binding.pry
end

def get_english_meaning(file_path, japanese_emoticon)
  emoticons = load_library(file_path)
  dictionary = emoticons["get_meaning"]
  # binding.pry
  if dictionary.include?(japanese_emoticon)
    dictionary[japanese_emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

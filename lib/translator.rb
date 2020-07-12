# require modules here
require 'pry'
require 'yaml'

def load_library(filepath)
  # code goes here
  emoticon_file = YAML.load_file(filepath)
  emoticons = Hash.new
  emoticons['get_meaning'] = {}
  emoticons['get_emoticon'] = {}
  emoticon_file.each do |meaning, icons|
    emoticons['get_meaning'][icons[1]] = meaning
    emoticons['get_emoticon'][icons[0]] = icons[1]
  end
  emoticons
end

def get_japanese_emoticon(filepath, english_emoticon)
  # code goes here
  emoticon_lib = load_library(filepath)
  if emoticon_lib['get_emoticon'].key?(english_emoticon)
    return emoticon_lib['get_emoticon'][english_emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(filepath, japanese_emoticon)
  # code goes here
  emoticon_lib = load_library(filepath)
  if emoticon_lib['get_meaning'].key?(japanese_emoticon)
    return emoticon_lib['get_meaning'][japanese_emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

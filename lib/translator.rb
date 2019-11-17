# require modules here
require "yaml"

def load_library(path)
  library = {
    "get_meaning" => {},
    "get_emoticon"=> {}
  } 
  YAML.load_file(path).each do |emotion, emoticons|
    eng = emoticons[0]
    jpn = emoticons[1]
    library["get_emoticon"][eng] = jpn
    library["get_meaning"][jpn] = emotion
  end
  library
end

def get_japanese_emoticon (path, emoticon)
  library = load_library(path)
  jpn_emoticon = library["get_emoticon"][emoticon]
  return jpn_emoticon if jpn_emoticon
  "Sorry, that emoticon was not found"
end

def get_english_meaning (path, emoticon)
  library = load_library(path)
  emotion = library["get_meaning"][emoticon]
  return emotion if emotion
  "Sorry, that emoticon was not found"
end
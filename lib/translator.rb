# require modules here
require "yaml"
require "pry"
# emoticons = YAML.load_file('emoticons.yml')

def load_library(path)
  # code goes here
  emoticons = YAML.load_file(path)
  hash = {"get_emoticon" => {}, "get_meaning" => {}}
  emoticons.each{ |english, array|
    hash["get_meaning"][array[1]] = english
    hash["get_emoticon"][array[0]]= array[1]
  }
  hash
end

def get_japanese_emoticon(path, emoticon)
  hash = load_library(path)
  hash["get_emoticon"].each{|eng, jpn|
    if eng == emoticon
      return jpn
    end
  }
  return "Sorry, that emoticon was not found"
  # code goes here
end

def get_english_meaning(path, emoticon)
  hash = load_library(path)
  hash["get_meaning"].each{|jpn, eng|
    if jpn == emoticon
      return eng
    end
  }
  return "Sorry, that emoticon was not found"
  # code goes here
end

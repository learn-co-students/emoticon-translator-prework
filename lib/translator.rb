require "yaml"
require 'pry'
def load_library(path)
emoticons = YAML.load_file(path)
hash = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticons.each do |meaning, emoticon|
    hash["get_emoticon"][emoticon.first] = emoticon.last
  end
  emoticons.each do |meaning, emoticon|
    hash["get_meaning"][emoticon.last] = meaning
  end
hash
#binding.pry
end

def get_japanese_emoticon(path, emoticon)
hash = load_library(path)
  hash["get_emoticon"].each do |key, value|
    if key == emoticon
      return value
    end
  end
"Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
hash = load_library(path)
  hash["get_meaning"].each do |key, value|
    if key == emoticon
      return value
    end
  end
  "Sorry, that emoticon was not found"
end

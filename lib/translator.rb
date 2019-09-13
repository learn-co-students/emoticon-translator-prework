# require modules here
require 'yaml'

def load_library(path)
  lib = YAML.load_file(path)
  hash = {
    "get_meaning" => {} ,
    "get_emoticon" => {}
  }
  lib.each do |meaning, emoticon|
    hash["get_meaning"][emoticon[1]] = meaning
    hash["get_emoticon"][emoticon[0]] = emoticon[1]
  end
  hash
end

def get_japanese_emoticon(path, emoticon)
  lib = load_library(path)
  english_emoticons = lib["get_emoticon"].keys
  if english_emoticons.include?(emoticon)
    lib["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticon)
  lib = load_library(path)
  japanese_emoticons = lib["get_meaning"].keys
  if japanese_emoticons.include?(emoticon)
    lib["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

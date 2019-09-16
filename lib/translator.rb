require "yaml"
require "pry"

def load_library(file_path)
  emoticon_file = YAML.load_file(file_path)
  emoticon_return = {"get_emoticon" => {}, "get_meaning" => {}}
  emoticon_file.each {|meaning, emoticons|
    emoticon_return["get_meaning"][emoticons[1]] = meaning
    emoticon_return["get_emoticon"][emoticons[0]] = emoticons[1]
  }
  emoticon_return
end

def get_japanese_emoticon(file_path, emoticon)
  emoticons = load_library(file_path)
  emoticons["get_emoticon"][emoticon] == nil ? "Sorry, that emoticon was not found" : emoticons["get_emoticon"][emoticon]
end

def get_english_meaning(file_path, emoticon)
  emoticons = load_library(file_path)
  emoticons["get_meaning"][emoticon] == nil ? "Sorry, that emoticon was not found" : emoticons["get_meaning"][emoticon]
end

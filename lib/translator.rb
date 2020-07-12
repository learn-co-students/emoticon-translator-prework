require 'pry'
require 'yaml'


file_path = "lib/emoticons.yml"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  hash = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticons.each do |meaning, both|
    hash["get_meaning"][both[1]]=meaning
    hash["get_emoticon"][both[0]]=both[1]
  end
  hash
end

def get_japanese_emoticon(file_path, emoticon)
  hash = load_library(file_path)
  if hash["get_emoticon"].keys.include? emoticon
    hash["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  hash = load_library(file_path)
  if hash["get_meaning"].keys.include? emoticon
    hash["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

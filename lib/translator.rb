# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  # code goes here
  file = YAML.load_file(file_path)
  dic = {
      "get_meaning" => {},
      "get_emoticon" => {}
  }
  file.each do |key, value|
      dic["get_meaning"][value[1]] = key
      dic["get_emoticon"][value[0]] = value[1]
  end
 dic
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  dict = load_library(file_path)
  dict["get_emoticon"][emoticon] || "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  dict = load_library(file_path)
  dict["get_meaning"][emoticon] || "Sorry, that emoticon was not found"
end

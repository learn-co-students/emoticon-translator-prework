# require modules here
require "pry"
require "yaml"

def load_library(file_path)
  # code goes here
  my_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  file = YAML.load_file(file_path)
  file.each do |meaning, emoticons|
    my_hash["get_meaning"][emoticons[1]] = meaning
    my_hash["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  my_hash
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  library = load_library(file_path)
  answer = library["get_emoticon"][emoticon]
  answer != nil ? answer : "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  library = load_library(file_path)
  answer = library["get_meaning"][emoticon]
  answer != nil ? answer : "Sorry, that emoticon was not found"
end

# require modules here
require 'yaml'

def load_library(file_path)
  # code goes here
  new_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticons = YAML.load_file(file_path)
  emoticons.each do |key, value|
    new_hash["get_meaning"][value[1]] = key
    new_hash["get_emoticon"][value[0]] = value[1]
  end
  new_hash
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  list = load_library(file_path)
  if list["get_emoticon"].has_key?(emoticon)
    return list["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  list = load_library(file_path)
  if list["get_meaning"].has_key?(emoticon)
    return list["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

puts load_library("lib/emoticons.yml")

# require modules here
require "yaml"
require "pry"

def load_library(file_path)
  # code goes here
  emoticons = YAML.load_file(file_path)
    new_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticons.each do |meaning, array|
    new_hash["get_meaning"][array[1]] = meaning
    new_hash["get_emoticon"][array[0]] = array[1]
  end
  new_hash
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  load_library(file_path)["get_emoticon"].each do |key, value|
    if key == emoticon
      return value
    end
  end
      return "Sorry, that emoticon was not found"
end

def get_english_meaning (file_path, emoticon)
  # code goes here
  load_library(file_path)["get_meaning"].each do |key, value|
    if key == emoticon
      return value
    end
  end
    return "Sorry, that emoticon was not found"
end

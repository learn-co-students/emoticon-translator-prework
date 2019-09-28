# require modules here
require "yaml"
require 'pry'

def load_library(file_path)
  new_hash = { 
  :get_meaning => {},
  :get_emoticon => {}
  }
emoji = YAML.load_file(file_path)
emoji.each do |key, value|
  
  new_hash[:get_meaning][value[1]] = key
  new_hash[:get_emoticon][value[0]] = value[1]
  #binding.pry
end
new_hash

end

def get_japanese_emoticon
  # code goes here
end

def get_english_meaning
  # code goes here
end
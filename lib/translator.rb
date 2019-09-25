# require modules here
require "yaml"
require 'pry'

def load_library(file_path)
 new_hash = {}
emoji = YAML.load_file(file_path)
emoji.each do |key, value|
end
new_hash[:get_meaning] = emoji 
new_hash[:get_emoticon] = emoji
new_hash
 #binding.pry
end

def get_japanese_emoticon
  # code goes here
end

def get_english_meaning
  # code goes here
end
# require modules here
require "yaml"

def load_library(file_path)
  
emoji = YAML.load_file_path(file_path)

emoji
end

def get_japanese_emoticon
  # code goes here
end

def get_english_meaning
  # code goes here
end
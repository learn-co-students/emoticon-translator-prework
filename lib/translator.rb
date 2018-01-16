# require modules here
require 'yaml'
require 'pry'

 # file = YAML.load_file("./lib/emoticons.yml")

def load_library(file_path)
  emoticon_file = YAML.load_file(file_path)
  emoticon_hash = { "get_meaning" => {}, "get_emoticon" => {} }

  emoticon_file.each do |key, val|
    emoticon_hash["get_meaning"][val.last] = key
    emoticon_hash["get_emoticon"][val.first] = val.last
  end

  emoticon_hash

end

def get_japanese_emoticon(file_path, emoticon)
  return_value = load_library(file_path)["get_emoticon"][emoticon]

  if return_value == nil
    "Sorry, that emoticon was not found"
  else
    return_value
  end

end

def get_english_meaning(file_path, emoticon)
  return_value = load_library(file_path)["get_meaning"][emoticon]

  if return_value == nil
    "Sorry, that emoticon was not found"
  else
    return_value
  end

end


# load_library(file)

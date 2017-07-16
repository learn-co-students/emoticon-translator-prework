# require modules here
require "yaml"
require "pry"


def load_library(file_path)
  # code goes here
  emoticons = YAML.load_file(file_path)
  new_emot_hash = {}
  new_emot_hash["get_meaning"]={}
  new_emot_hash["get_emoticon"]={}

  emoticons.each do |meaning, emot_array|

    temp_hash = {emot_array[1] => meaning}
    new_emot_hash["get_meaning"].merge!(temp_hash)

    temp_hash =  {emot_array[0] => emot_array[1]}
    new_emot_hash["get_emoticon"].merge!(temp_hash)

  end
  #binding.pry
  new_emot_hash
end

def get_japanese_emoticon(file_path, emot)

  emoticons = load_library(file_path)

  if emoticons["get_emoticon"].keys.include?(emot)
    emoticons["get_emoticon"][emot]
  else
    "Sorry, that emoticon was not found"
  end
  #binding.pry
  # code goes here
end

def get_english_meaning(file_path, emot)

  emoticons = load_library(file_path)

  if emoticons["get_meaning"].keys.include?(emot)
    emoticons["get_meaning"][emot]
  else
    "Sorry, that emoticon was not found"
  end
  # code goes here
end

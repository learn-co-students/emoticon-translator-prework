# require modules here
require 'yaml'

def load_library(file_path)
  hash = YAML.load_file(file_path)
  new_hash = {"get_emoticon" => {}, "get_meaning" => {}}
  hash.each do |key, value|
    new_hash["get_emoticon"] = new_hash["get_emoticon"].merge({value[0] => value[1]})
    new_hash["get_meaning"] = new_hash["get_meaning"].merge({value[1] => key})
  end
  new_hash
end

def get_japanese_emoticon(file_path, emoticon)
  emoji_hash = load_library(file_path)
  japanese_emoticon = emoji_hash["get_emoticon"][emoticon]
  if japanese_emoticon
    return japanese_emoticon
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  emoji_hash = load_library(file_path)
  english_emoticon = emoji_hash["get_meaning"][emoticon]
  if english_emoticon
    return english_emoticon
  else
    return "Sorry, that emoticon was not found"
  end 
end

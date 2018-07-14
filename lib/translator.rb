require 'yaml'
require 'pry'

def load_library(file_path)
  new_hash = {"get_emoticon" => YAML.load_file(file_path), "get_meaning" => YAML.load_file(file_path)}
  new_emoticon_hash = {"get_emoticon" => YAML.load_file(file_path), "get_meaning" => {}}
  
  new_hash["get_meaning"].each do |meaning, emoticons|
    new_emoticon_hash["get_meaning"][emoticons[1]] = meaning
  end
  
  new_hash["get_emoticon"].each do |meaning, emoticons|
    new_emoticon_hash["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  
  return new_emoticon_hash
  
end

def get_japanese_emoticon(file_path, emoticon)
  new_hash = load_library(file_path)
  
  if new_hash["get_emoticon"].include?(emoticon)
    return new_hash["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
    
end

def get_english_meaning(file_path, emoticon)
  new_hash = load_library(file_path)
  
  if new_hash["get_meaning"].include?(emoticon)
    return new_hash["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end
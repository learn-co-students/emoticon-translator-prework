# require modules here
require 'yaml'
require 'pry'

def load_library(path)
  return_hash = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  file = YAML.load_file(path)
  file.each do |a, b|
    return_hash["get_meaning"].merge!({ b[1] => a })
    return_hash["get_emoticon"].merge!({ b[0] => b[1] })
  end
  return_hash
end

def get_japanese_emoticon(path, emoticon)
  hash_table = load_library(path)
  hash_table["get_emoticon"].each do |en, ja|
    return ja if emoticon == en
  end
  msg = "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  hash_table = load_library(path)
  hash_table["get_meaning"].each do |ja, meaning|
    return meaning if emoticon == ja
  end
  msg = "Sorry, that emoticon was not found"
end

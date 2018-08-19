require 'yaml'
require "pry"

def load_library(path)
  yaml_data = YAML.load_file(path)
  emoticon_data = {"get_meaning" => {}, "get_emoticon" => {}}
  yaml_data.each do |k,v|
    emoticon_data["get_meaning"][v[1]] = k
    emoticon_data["get_emoticon"][v[0]] = v[1]
  end
  emoticon_data
end

def get_japanese_emoticon(path, emoticon)
  emoticon_data = load_library(path)
  japanese_emoticon = emoticon_data["get_emoticon"][emoticon]
  if !japanese_emoticon
    "Sorry, that emoticon was not found"
  else
    japanese_emoticon
  end
end

def get_english_meaning(path, emoticon)
  emoticon_data = load_library(path)
  meaning = emoticon_data["get_meaning"][emoticon]
  if !meaning
    "Sorry, that emoticon was not found"
  else
    meaning
  end
end

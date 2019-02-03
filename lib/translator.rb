# require modules here
require 'yaml'
require 'pry'

def load_library(path)
  # code goes here
  emoticons = YAML.load_file("#{path}")
  emo_list = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticons.each do |key, value|
    emo_list["get_meaning"][value[1]] = key
    emo_list["get_emoticon"][value[0]] = value[1]
  end
  return emo_list
end

def get_japanese_emoticon(path, emoticon)
  # code goes here
  emo_list = load_library(path)
  if emo_list["get_emoticon"].keys.include?(emoticon)
    return emo_list["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticon)
  # code goes here
  emo_list = load_library(path)
  if emo_list["get_meaning"].keys.include?(emoticon)
    return emo_list["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

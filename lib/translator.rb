# require modules here
require "yaml"

def load_library(filename)
  # code goes here
  emoticon_hash = YAML.load_file(filename)
  emoticon_dic = {"get_meaning" => {},  "get_emoticon" => {}}
  emoticon_hash.each do |key, val|
    emoticon_dic["get_meaning"][val[1]] = key
    emoticon_dic["get_emoticon"][val[0]] = val[1]
  end
  emoticon_dic
end

def get_japanese_emoticon(filename, emoticon)
  # code goes here
  emoticons_dic = load_library(filename)
  if emoticons_dic["get_emoticon"][emoticon]
    emoticons_dic["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(filename, emoticon)
  # code goes here
  emoticons_dic = load_library(filename)
  if emoticons_dic["get_meaning"][emoticon]
    emoticons_dic["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

require "pry" 
require "yaml"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  final_hash = {}
  emoticons.each do |key, array|
    english_emoticon = emoticons[key][0]
    japanese_emoticon = emoticons[key][1]
    if final_hash == {}
      final_hash = {"get_emoticon" => {english_emoticon => japanese_emoticon}, "get_meaning" => {japanese_emoticon => key}}
    else 
      final_hash["get_emoticon"][english_emoticon] = japanese_emoticon
      final_hash["get_meaning"][japanese_emoticon] = key
    end  
  end 
  final_hash
end

def get_japanese_emoticon(file_path, english_emoticon)
  emoticon_translator_hash = load_library(file_path)
  if emoticon_translator_hash["get_emoticon"][english_emoticon]
  emoticon_translator_hash["get_emoticon"][english_emoticon]
  else
    "Sorry, that emoticon was not found"
  end 
end

def get_english_meaning
  # code goes here
end
# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  # code goes here
  emoticon_library_yaml = YAML.load_file(file_path)
  organized_emoticon_library = {
    "get_emoticon" => {},
    "get_meaning" => {}
  }

  emoticon_library_yaml.each do |emotion, emoticons|
      organized_emoticon_library["get_emoticon"][emoticons[0]] = emoticons[1]
      organized_emoticon_library["get_meaning"][emoticons[1]] = emotion
  end
  organized_emoticon_library
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  emoticon_library = load_library(file_path)
  japanese_emoticon_equiv = emoticon_library["get_emoticon"][emoticon]
  if japanese_emoticon_equiv == nil
    "Sorry, that emoticon was not found"
  else
    japanese_emoticon_equiv
  end
end

def get_english_meaning(file_path, jp_emoticon)
  # code goes here
  emoticon_library = load_library(file_path)
  english_meaning = emoticon_library["get_meaning"][jp_emoticon]

  if english_meaning == nil
    "Sorry, that emoticon was not found"
  else
    english_meaning
  end
end

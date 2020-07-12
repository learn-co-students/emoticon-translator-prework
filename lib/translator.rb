require "yaml"
require "pry"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  dictionary = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticons.each_with_object(dictionary) do |(emotion, arr), dictionary|
    dictionary["get_meaning"][arr[1]] = emotion
    dictionary["get_emoticon"][arr[0]] = arr[1]
  end
end

def get_japanese_emoticon(file_path, emoticon)
  dictionary = load_library(file_path)
  if dictionary["get_emoticon"].include?(emoticon)
    dictionary["get_emoticon"].fetch(emoticon)
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  dictionary = load_library(file_path)
  if dictionary["get_meaning"].include?(emoticon)
    dictionary["get_meaning"].fetch(emoticon)
  else
    "Sorry, that emoticon was not found"
  end  
end

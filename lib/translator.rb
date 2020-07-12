require "yaml"
require 'pry'
def load_library(file_path)
emo_hash = {'get_meaning' => {}, 'get_emoticon' => {}}
  emo_key = YAML.load_file(file_path)
  emo_key.each do |meaning, array|
    emo_hash['get_meaning'][array[1]] = meaning
    emo_hash['get_emoticon'][array[0]] = array[1]
  end
  emo_hash
end

def get_japanese_emoticon(file_path, emoticon)
  emo_hash = load_library(file_path)
  if emo_hash['get_emoticon'].include?(emoticon)
    emo_hash['get_emoticon'][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  emo_hash = load_library(file_path)
  if emo_hash['get_meaning'].include?(emoticon)
    emo_hash['get_meaning'][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

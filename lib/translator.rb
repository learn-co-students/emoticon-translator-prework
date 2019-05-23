# require modules here
require "yaml"

def load_library(file_path)
  emojis = YAML.load_file(file_path)
  result = {"get_meaning" => {}, "get_emoticon" => {}}
  emojis.each do |meaning, emoticons|
    result["get_meaning"][emoticons[1]] = meaning
    result["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  result
end

def get_japanese_emoticon(file_path = './lib/emoticons.yml', english_emoticon)
  emojis = load_library(file_path)
  if emojis["get_emoticon"].include?(english_emoticon)
    emojis["get_emoticon"][english_emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path = './lib/emoticons.yml', japanese_emoticon)
  emojis = load_library(file_path)
  if emojis["get_meaning"].include?(japanese_emoticon)
    emojis["get_meaning"][japanese_emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

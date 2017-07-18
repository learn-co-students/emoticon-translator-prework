# require modules here
require 'yaml'
require 'pry'


def load_library(file_path)
  library = YAML.load_file(file_path)
  return_hash = {"get_emoticon" => {}, "get_meaning" => {}}
  library.each do |emotion, emoticons|
    emoticons.each do |emoticon|
      return_hash["get_meaning"][emoticon] = emotion
    end
    return_hash["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  return_hash
end

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  library["get_emoticon"].each do |english, japanese|
    return japanese if emoticon==english
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  library["get_meaning"].each do |emoticon_key, meaning|
    return meaning if emoticon_key==emoticon
  end
  "Sorry, that emoticon was not found"
end

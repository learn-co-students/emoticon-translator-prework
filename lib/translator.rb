require "yaml"# require modules here
require 'pry'
def load_library(emoticons)
  emoticons = YAML.load_file('./lib/emoticons.yml')
  emo = {}
  emo["get_meaning"] = {}
  emo["get_emoticon"] = {}
  emoticons.each do |title, meaning|
    emo["get_meaning"][meaning.last]= title
    emo["get_emoticon"][meaning.first] = meaning.last
  end
  emo
end

def get_japanese_emoticon(file_path, emoticon)
  lib = load_library(file_path)

  if lib["get_emoticon"][emoticon]
    lib["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  lib = load_library(file_path)
  if lib["get_meaning"][emoticon]
    lib["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

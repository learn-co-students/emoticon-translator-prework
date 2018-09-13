# require modules here
require 'yaml'
require 'pry'
def load_library(path)
  # code goes here
  emoticons = YAML.load_file(path)
end

def get_japanese_emoticon(path, amer_emote)
  # code goes here
  emoticons = load_library(path)
  if emoticons["get_emoticon"][amer_emote] != nil
    emoticons["get_emoticon"][amer_emote]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, japan_emote)
  # code goes here
    emoticons = load_library(path)
  if emoticons["get_meaning"][japan_emote] != nil
    emoticons["get_meaning"][japan_emote]
  else
    return "Sorry, that emoticon was not found"
  end
end
# require modules here
require "yaml"

def load_library(emoticons)
  emoticons = YAML.load_file('./lib/emoticons.yml')
  new_hash = Hash.new
  new_hash["get_emoticon"] = Hash.new
  new_hash["get_meaning"] = Hash.new
  emoticons.each do |english, emote|
  new_hash["get_emoticon"][emote.first] = emote.last
  new_hash["get_meaning"][emote.last] = english
  end
  new_hash
end

def get_japanese_emoticon(path, emoticon)
    emote_hash = load_library(path)
    output = emote_hash["get_emoticon"][emoticon]
    if output == nil
      output = "Sorry, that emoticon was not found"
end
output
end

def get_english_meaning(path, emoticon)
  english_meaning = load_library(path)
  output = english_meaning["get_meaning"][emoticon]
  if output == nil
    output = "Sorry, that emoticon was not found"

  end
output
end

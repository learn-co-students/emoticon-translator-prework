# require modules here
require 'pry'
require 'yaml'

def load_library(emoticon)
  emotes = YAML.load_file(emoticon)
  emotes_hash = Hash.new
  emotes_hash["get_emoticon"] = Hash.new
  emotes_hash["get_meaning"] = Hash.new
  emotes.each do |english, emo|
    emotes_hash["get_emoticon"][emo.first] = emo.last
    emotes_hash["get_meaning"][emo.last] = english
  end
  emotes_hash
end

def get_japanese_emoticon(ref, emoticon)
  emotes_hash = load_library(ref)
  reply = emotes_hash["get_emoticon"][emoticon]
  if reply == nil
    reply = "Sorry, that emoticon was not found"
  end
  reply
end


def get_english_meaning(ref, emoticon)
  emotes_hash = load_library(ref)
  reply = emotes_hash["get_meaning"][emoticon]
  if reply == nil
    reply = "Sorry, that emoticon was not found"
  end
  reply
end
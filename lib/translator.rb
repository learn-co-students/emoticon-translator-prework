# require modules here
require "yaml"

def load_library(file)
  new_hash = {}
  new_hash["get_meaning"] = {}
  new_hash["get_emoticon"] = {}

  list = YAML.load_file(file)
  list.each do |hash, array|
    new_hash["get_meaning"][array[1]] = hash
    new_hash["get_emoticon"][array[0]] = array[1]
  end

  return new_hash
end

def get_japanese_emoticon(file, emoticon)
  # code goes here
  list = load_library(file)
  list["get_emoticon"].each do |english_emote, jp_emote|
    if english_emote == emoticon
      return jp_emote
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emoticon)
  # code goes here
  list = load_library(file)
  puts list
  list["get_meaning"].each do |emote, meaning|
    if emote == emoticon
      return meaning
    end
  end
  return "Sorry, that emoticon was not found"
end

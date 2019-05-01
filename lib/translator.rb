require "yaml"
require "pry"

def load_library(path)
  emoticonHash = {}
  emoticonHash["get_emoticon"] = {}
  emoticonHash["get_meaning"] = {}
  file = YAML.load_file(path)
  file.each do |emoticon, meaning|
    emoticonHash["get_meaning"][meaning[1]] = emoticon
    emoticonHash["get_emoticon"][meaning[0]] = meaning[1]
  end
  emoticonHash
end


def get_japanese_emoticon(path, emoticon)
  emoticonHash = load_library(path)
  if emoticonHash["get_emoticon"][emoticon] != nil
    emoticonHash["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticon)
  emoticonHash = load_library(path)
  if emoticonHash["get_meaning"][emoticon] != nil
    emoticonHash["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end
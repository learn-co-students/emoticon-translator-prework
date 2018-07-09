# require modules here
require "yaml"
def load_library(path)
  # code goes here
  
  emotions = YAML.load_file(path)
  emotion={}
  emotion["get_emoticon"] = {}
  emotion["get_meaning"] = {}
  emotions.each{|meaning, icons|
    emotion["get_meaning"][icons[1]] = meaning
    emotion["get_emoticon"][icons[0]] = icons[1]
  }
  emotion
end

def get_japanese_emoticon(path, icon)
  # code goes here
  emotion = load_library(path)
  if emotion["get_emoticon"][icon] == nil
    return "Sorry, that emoticon was not found"
  else
    return emotion["get_emoticon"][icon]
  end
end

def get_english_meaning(path, icon)
  # code goes here
  emotion = load_library(path)
  if emotion["get_meaning"][icon] == nil
    return "Sorry, that emoticon was not found"
  else
    return emotion["get_meaning"][icon]
  end
end
require 'yaml'

def load_library(path)
  library = YAML.load_file("./lib/emoticons.yml")
  emotions = {}
  emotions["get_meaning"] = {}
  emotions["get_emoticon"] = {}
  library.each do |meaning, emoticon|
    emotions["get_meaning"][emoticon[1]] = meaning
    emotions["get_emoticon"][emoticon[0]] = emoticon[1]
  end
  emotions
end

def get_japanese_emoticon(path, emoticon)
  library = load_library(path)
  if library["get_emoticon"][emoticon] == nil
    return "Sorry, that emoticon was not found"
  else
    return library["get_emoticon"][emoticon]
  end
end

def get_english_meaning(path, emoticon)
  library = load_library(path)
  if library["get_meaning"][emoticon] == nil
    return "Sorry, that emoticon was not found"
  else
    return library["get_meaning"][emoticon]
  end
end

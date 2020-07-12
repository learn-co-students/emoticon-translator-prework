require "pry"
require "yaml"

def load_library(file)

  emo = YAML.load_file("#{file}")
  new_emo = {}
  new_emo["get_emoticon"] = {}
  new_emo["get_meaning"] = {}

  emo.each do |meaning, emoticon_array|
    new_emo["get_meaning"][emoticon_array[1]] = meaning
    new_emo["get_emoticon"][emoticon_array[0]] = emoticon_array[1]
  end
return new_emo
end


def get_japanese_emoticon(file, emoticon)
  emoticon_hash = load_library(file)
  if emoticon_hash["get_emoticon"][emoticon]
    emoticon_hash["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end


def get_english_meaning(file, emoticon)
  emoticon_hash = load_library(file)
  if emoticon_hash["get_meaning"][emoticon]
    emoticon_hash["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

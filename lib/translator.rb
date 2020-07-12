require "yaml"
require "pry"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  return_hash = {"get_meaning" => {}, "get_emoticon" => {}}

  emoticons.each do |name, emote|
    return_hash["get_meaning"][emote[1]] = name
    return_hash["get_emoticon"][emote[0]] = emote[1]
  end

  return_hash
end

def get_japanese_emoticon(file_path, emoticon)
  translate = load_library(file_path)

  if translate["get_emoticon"][emoticon]
    translate["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  translate = load_library(file_path)

  if translate["get_meaning"][emoticon]
    translate["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

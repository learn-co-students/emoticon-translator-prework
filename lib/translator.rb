# require modules here


def load_library(file_path)
  # code goes here
emojis = {"get_meaning" => {}, "get_emoticon" => {}}
require "yaml"

emoji_hash = YAML.load_file(file_path)

emoji_hash.each do |key, value|
  emojis["get_meaning"][value[1]] = key
  emojis["get_emoticon"][value[0]] = value[1]
end

return emojis

end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  emojis = load_library(file_path)

  if emojis["get_emoticon"].include?(emoticon) == false
    return "Sorry, that emoticon was not found"
  else
  return emojis["get_emoticon"][emoticon]
end
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  emojis = load_library(file_path)

  if emojis["get_meaning"].include?(emoticon) == false
    return "Sorry, that emoticon was not found"
  else
    return emojis["get_meaning"][emoticon]
  end
end

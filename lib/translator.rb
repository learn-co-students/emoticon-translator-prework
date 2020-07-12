require "yaml"
# file_path = './lib/emoticons.yml'

def load_library(file_path)
  hash = {
    "get_meaning" =>{},
    "get_emoticon" =>{}
  }
  YAML.load_file(file_path).each do |meaning, en_jp_array|
    hash["get_emoticon"][en_jp_array[0]] = en_jp_array[1]
    hash["get_meaning"][en_jp_array[1]] = meaning
  end
  hash
end

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  result = library["get_emoticon"][emoticon]
  if !result
    "Sorry, that emoticon was not found"
  else
    result
  end
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  result = library["get_meaning"][emoticon]
  if !result
    "Sorry, that emoticon was not found"
  else
    result
  end
end

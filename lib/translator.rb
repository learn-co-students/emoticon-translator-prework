require "yaml"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  return_hash = {"get_emoticon" => {}, "get_meaning" => {}}
  emoticons.each do |name, symbol|
    return_hash["get_emoticon"][symbol[0]] = symbol[1]
    return_hash["get_meaning"][symbol[1]] = name
  end
  return_hash
end

def get_japanese_emoticon(file_path, emoticon)
  hash = load_library(file_path)
  if hash["get_emoticon"][emoticon] == nil
    return "Sorry, that emoticon was not found"
  else
    return hash["get_emoticon"][emoticon]
  end
end

def get_english_meaning(file_path, emoticon)
  hash = load_library(file_path)
  if hash["get_meaning"][emoticon] == nil
    return "Sorry, that emoticon was not found"
  else
    return hash["get_meaning"][emoticon]
  end
end

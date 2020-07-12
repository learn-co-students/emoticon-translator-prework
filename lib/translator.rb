# require modules here
require "yaml"

def load_library(file_path)
  emoticon_yaml = YAML.load_file(file_path)
  emoticon_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticon_yaml.each do |k, v|
    emoticon_hash["get_meaning"][v[1]] = k
    emoticon_hash["get_emoticon"][v[0]] = v[1]
  end
  emoticon_hash
end

def get_japanese_emoticon(file_path, emoticon)
  emoticon_hash = load_library(file_path)
  if emoticon_hash["get_emoticon"].include?(emoticon)
    return emoticon_hash["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  emoticon_hash = load_library(file_path)
  if emoticon_hash["get_meaning"].include?(emoticon)
    return emoticon_hash["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

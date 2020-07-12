require 'yaml'

def load_library(yaml_path)
  emoticon_hash = { "get_meaning" => {}, "get_emoticon" => {} }
  raw_data = YAML.load_file(yaml_path)
  raw_data.each do |meaning, emoticons|
    emoticon_hash["get_meaning"][emoticons[1]] = meaning
    emoticon_hash["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  emoticon_hash
end

def get_japanese_emoticon(yaml_path, emoticon)
  answer = load_library(yaml_path)["get_emoticon"][emoticon]
  return answer if answer 
  "Sorry, that emoticon was not found"
end

def get_english_meaning(yaml_path, emoticon)
  answer = load_library(yaml_path)["get_meaning"][emoticon]
  return answer if answer 
  "Sorry, that emoticon was not found"
end
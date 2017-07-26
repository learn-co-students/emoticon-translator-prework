# require modules here
require "yaml"
require "pp"

def load_library(file_path)
  # code goes here
  yaml_raw = YAML.load_file(file_path)
  emoticon_translator_hash = {
    "get_meaning" => {},
    "get_emoticon" => {},
  }

  yaml_raw.each do |meaning_key, emoticon_array|
    emoticon_translator_hash["get_emoticon"][emoticon_array[0]] = emoticon_array[1]
    emoticon_translator_hash["get_meaning"][emoticon_array[1]] = meaning_key
  end

  emoticon_translator_hash
end

def get_japanese_emoticon(yaml_file_path, emoticon)
  # code goes here
  emoticon_translator_hash = load_library(yaml_file_path)

  if emoticon_translator_hash["get_emoticon"].keys.include?(emoticon)
    emoticon_translator_hash["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(yaml_file_path, emoticon)
  # code goes here
  emoticon_translator_hash = load_library(yaml_file_path)

  if emoticon_translator_hash["get_meaning"].keys.include?(emoticon)
    emoticon_translator_hash["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

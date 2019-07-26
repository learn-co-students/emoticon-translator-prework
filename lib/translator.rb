# require modules here
require "yaml"
def load_library (file)
  orig_hash = YAML.load_file(file)
  hash = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  orig_hash.each do |key, array|
    hash["get_meaning"][array[1]] = key
    hash["get_emoticon"][array[0]] = array[1]
  end

  return hash
end

def get_japanese_emoticon (file, am_em)
  hash = load_library(file)
  puts hash
  jap_em = hash["get_emoticon"][am_em] if hash["get_emoticon"].has_key?(am_em)
  return "Sorry, that emoticon was not found" if jap_em == nil
  return jap_em
end

def get_english_meaning (file, jap_em)
  hash = load_library(file)
  meaning = hash["get_meaning"][jap_em] if hash["get_meaning"].has_key?(jap_em)
  return "Sorry, that emoticon was not found" if meaning == nil
  return meaning
end

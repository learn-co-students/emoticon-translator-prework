require "yaml"

def load_library(path)
  emot_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  YAML.load_file(path).each do |emotion, symbol|
    eng_symbol, jap_symbol = symbol
    emot_hash["get_emoticon"][eng_symbol] = jap_symbol
    emot_hash["get_meaning"][jap_symbol] = emotion
  end
  emot_hash
end

def get_japanese_emoticon(path, emoticon)
  emot_hash = load_library(path)
  if emot_hash["get_emoticon"][emoticon] == nil
    "Sorry, that emoticon was not found"
  else
    emot_hash["get_emoticon"][emoticon]
  end
end

def get_english_meaning(path, emoticon)
  emot_hash = load_library(path)
  if emot_hash["get_meaning"][emoticon] == nil
    "Sorry, that emoticon was not found"
  else
    emot_hash["get_meaning"][emoticon]
  end
end

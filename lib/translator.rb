require "yaml"
#English emoticon is always at index 0
#Japanese emoticon is always at index 1
def load_library(filepath)
  lib = YAML.load_file(filepath)
  unnecessary_new_hash = {}
  unnecessary_new_hash["get_meaning"]= {}
  unnecessary_new_hash["get_emoticon"]= {}
  lib.each do |meaning, emo_arr|
    unnecessary_new_hash["get_meaning"][emo_arr[1]]= meaning
    unnecessary_new_hash["get_emoticon"][emo_arr[0]]= emo_arr[1]
  end
  unnecessary_new_hash
end

def get_japanese_emoticon(filepath, emoticon)
  emohash = load_library(filepath)
  if emohash["get_emoticon"][emoticon]
    return emohash["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(filepath, emoticon)
  emohash = load_library(filepath)
  if emohash["get_meaning"][emoticon]
    return emohash["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

puts load_library('lib/emoticons.yml')

require "yaml"

def load_library(file_path)
  file_hash = YAML::load_file(file_path)
  new_hash = {}
  new_hash["get_meaning"] = {}
  new_hash["get_emoticon"] = {}
  meaning_holder = ""

  file_hash.each do |meaning, emoticons|
    new_hash["get_emoticon"][emoticons[0]] = emoticons[1]
    new_hash["get_meaning"][emoticons[1]] = meaning
  end

  new_hash
end

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)

  library["get_emoticon"][emoticon].nil? ? "Sorry, that emoticon was not found" : library["get_emoticon"][emoticon]
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)

  library["get_meaning"][emoticon].nil? ? "Sorry, that emoticon was not found" : library["get_meaning"][emoticon]
end

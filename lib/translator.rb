require "yaml"

def load_library(file_path)
  library_hash = {"get_meaning" => { }, "get_emoticon" => { }}
  emoticons = YAML.load_file(file_path)
  emoticons.each do |name, emoticon|
    library_hash["get_meaning"][emoticon[1]] = name
    library_hash["get_emoticon"][emoticon[0]] = emoticon[1]
  end
  library_hash
end

def get_japanese_emoticon(file_path, emoticon)
  emoticon_library = load_library(file_path)
  if emoticon_library["get_emoticon"][emoticon]
    emoticon_library["get_emoticon"][emoticon]
  else 
  "Sorry, that emoticon was not found"
end
  
end

def get_english_meaning(file_path, emoticon)
    emoticon_library = load_library(file_path)
  if emoticon_library["get_meaning"][emoticon]
    emoticon_library["get_meaning"][emoticon]
  else 
  "Sorry, that emoticon was not found"
end
end
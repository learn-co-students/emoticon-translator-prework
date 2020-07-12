require "yaml"

def load_library(file)
   hash = { "get_emoticon" => {}, "get_meaning" => {} }
   YAML.load_file(file).each do |x, y|
     english, japanese = y
     hash["get_emoticon"][english] = japanese
     hash["get_meaning"][japanese] = x
   end
   hash
end

def get_japanese_emoticon(file, emoticon)
  hash = load_library(file)
  if hash["get_emoticon"][emoticon] 
     hash["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
   end
end

def get_english_meaning(file, emoticon)
  hash = load_library(file)
  if hash["get_meaning"][emoticon]
     hash["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end
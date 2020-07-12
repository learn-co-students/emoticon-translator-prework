 require "yaml"

def load_library(file)
emoticons=YAML.load_file("lib/emoticons.yml")
  hash={}
  hash["get_emoticon"]={}
  hash["get_meaning"]={}
emoticons.each do |key,value|
  #assign meaning to both english and japanese icons
  hash["get_meaning"][value[0]] = key  
  hash["get_meaning"][value[1]] = key
  #translate between english and japanese icons
  hash["get_emoticon"][value[1]] =value[0]  
  hash["get_emoticon"][value[0]] = value[1] 
end
hash
end


def get_japanese_emoticon(file,emoticon)
  hash=load_library(file)
  if hash["get_emoticon"].has_key?(emoticon)
  hash["get_emoticon"][emoticon]
  else
  "Sorry, that emoticon was not found"
end
end
def get_english_meaning(file,emoticon)
  hash=load_library(file)
  if hash["get_meaning"].has_key?(emoticon)
  hash["get_meaning"][emoticon]
  else
  "Sorry, that emoticon was not found"
end
end
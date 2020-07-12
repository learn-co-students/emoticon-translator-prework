require "yaml"

def load_library(file)
  lib = 
  {"get_meaning" => {}, 
  "get_emoticon" => {} }
  YAML.load_file(file).each do |trans, array|
    eng, jpn = array
    lib["get_emoticon"][eng] = jpn
    lib["get_meaning"][jpn] = trans
  end
  lib
end


def get_japanese_emoticon(path, icon)
  lib = load_library(path)
  emoticon = lib["get_emoticon"][icon]
  if emoticon  
    emoticon 
  else
    "Sorry, that emoticon was not found"
end
end


def get_english_meaning(path, icon)
   lib = load_library(path)
  emoticon = lib["get_meaning"][icon]
  if emoticon  
    emoticon 
  else
    "Sorry, that emoticon was not found"
end
end
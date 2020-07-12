# require modules here
require 'yaml'
require 'pry'

def load_library(path)
  lib = {"get_meaning" => {},
        "get_emoticon" => {} }

  YAML.load_file(path).each do |word, symbol|
    eng,jap = symbol
    lib["get_emoticon"][eng] = jap
    lib["get_meaning"][jap] = word
  end
  return lib
  # code goes here
end

def get_japanese_emoticon(path,emo)
  lib = load_library(path)
  rtn = lib["get_emoticon"][emo]
  if !(rtn == nil)
    return rtn
  else
    return "Sorry, that emoticon was not found"
  end
  # code goes here
end

def get_english_meaning(path, emo)
  # code goes here
  lib = load_library(path)
  rtn = lib["get_meaning"][emo]
  if !(rtn == nil)
    return rtn
  else
    return "Sorry, that emoticon was not found"
  end
end

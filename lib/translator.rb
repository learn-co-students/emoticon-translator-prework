require "yaml"
require "pry"

def load_library(path)
  library = YAML.load_file(path)
  lib = {"get_meaning" => {}, "get_emoticon" => {}}
  library.each do |key, value|
    eng = value[0]
    jap = value[1]
    lib["get_meaning"][jap] = key
    lib["get_emoticon"][eng] = jap
  end
  lib
end

def get_japanese_emoticon(path, emoticon)
  lib = load_library(path)
  if lib["get_emoticon"].include?(emoticon)
    lib["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticon)
  lib = load_library(path)
  if lib["get_meaning"].include?(emoticon)
    lib["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

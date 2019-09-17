# require modules here

def load_library(path)
  require "yaml"
  lib = YAML.load_file(path)
  out = {"get_meaning" => {}, "get_emoticon" => {}}
  lib.each do |meaning, emotes|
    out["get_meaning"][emotes[1]] = meaning.to_s
    out["get_emoticon"][emotes[0]] = emotes[1]
  end
  out
end

def get_japanese_emoticon(path, emoticon)
  lib = load_library(path)
  out = "Sorry, that emoticon was not found"
  if lib["get_emoticon"][emoticon] != nil
    out = lib["get_emoticon"][emoticon]
  end
  out
      
end

def get_english_meaning(path, emoticon)
  lib = load_library(path)
  out = "Sorry, that emoticon was not found"
  if lib["get_meaning"][emoticon] != nil
    out = lib["get_meaning"][emoticon]
  end
  out
end
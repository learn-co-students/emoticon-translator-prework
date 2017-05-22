require 'yaml'

def load_library(file)
  lib = YAML.load_file(file)
  emoji = {"get_meaning" => {}, "get_emoticon" => {}}
  lib.each do |name, value|
    emoji["get_meaning"][value[1]] = name
    emoji["get_emoticon"][value[0]] = value[1]
  end
  emoji
end

def get_japanese_emoticon(file, emoticon)
  lib = load_library(file)
  emoji = lib["get_emoticon"][emoticon]
  emoji ? emoji : "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emoticon)
  lib = load_library(file)
  meaning = lib["get_meaning"][emoticon]
  meaning ? meaning : "Sorry, that emoticon was not found"
end

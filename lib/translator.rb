require "yaml"
require 'pry'

# require modules here

def load_library(emoticons_path)
  new_hash = {"get_meaning" => {}, "get_emoticon" => {} }
    YAML.load_file(emoticons_path).each do |meaning, emoticon_array|
      english = emoticon_array[0]
      japanese = emoticon_array[1]
        new_hash["get_emoticon"][english] = japanese
        new_hash["get_meaning"][japanese] = meaning
    end
    new_hash
end

def get_japanese_emoticon(emoticons_path, emoticon)
  library = load_library(emoticons_path)
  if library["get_emoticon"][emoticon]
    library["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(emoticons_path, emoticon)
  library = load_library(emoticons_path)
  if library["get_meaning"][emoticon]
    library["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

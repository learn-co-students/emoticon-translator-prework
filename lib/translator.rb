# require modules here
require "yaml"

def load_library(path)
  # code goes here
  emoticon_hash = YAML.load_file(path)
  new_hash = {}
  new_hash["get_emoticon"] = {}
  new_hash["get_meaning"] = {}

  emoticon_hash.each do |name, emoticons|
    new_hash["get_emoticon"][emoticons[0]] = emoticons[1]
    new_hash["get_meaning"][emoticons[1]] = name
  end
  new_hash
end

def get_japanese_emoticon(path,emoticon)
  # code goes here
  library = load_library(path)

  library.each do |key, values|
    values.each do |american, japanese|
      if emoticon == american
        return japanese
      end
    end
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  # code goes here
  library = load_library(path)

  library.each do |key, values|
    values.each do |japanese, american|
      if emoticon == japanese
        return american
      end
    end
  end
  "Sorry, that emoticon was not found"
end

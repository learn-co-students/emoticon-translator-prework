require "yaml"
require 'pry'

def load_library(path)
  hash = YAML.load_file(path)
  new_hash= {}
  new_hash["get_emoticon"] = {}
  new_hash["get_meaning"] = {}
  hash.each do |name, emoticons|
    new_hash["get_emoticon"][emoticons[0]] = emoticons[1]
    new_hash["get_meaning"][emoticons[1]] = name
  end
  new_hash
end

def get_japanese_emoticon(path, emoticon)
  guide = load_library(path)
  guide.each do |key, values|
    values.each do |american, japanese|
      if emoticon == american
        return japanese
      end
    end
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  guide = load_library(path)
  guide.each do |key, values|
    values.each do |japan, meaning|
      if emoticon == japan
        return meaning
      end
    end
  end
  "Sorry, that emoticon was not found"
end

require "yaml"
require 'pry'


def load_library(file)
  new_hash = {}
  translation = YAML.load_file(file)
  translation.each do |meaning, emoticons|
      new_hash ||= {}
      new_hash ||= {}
      new_hash["get_meaning"] ||= {}
      new_hash["get_emoticon"] ||= {}
      new_hash["get_meaning"][emoticons.last] ||= meaning
      new_hash["get_emoticon"][emoticons.first] ||= emoticons.last
  end
  new_hash
end

def get_japanese_emoticon(file, emoticon)
  translator = load_library(file)
  find = translator["get_emoticon"][emoticon]
  if find
    find
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, emoticon)
  translator = load_library(file)
  find = translator["get_meaning"][emoticon]
  if find
    find
  else
    "Sorry, that emoticon was not found"
  end
end

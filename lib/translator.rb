# require modules here
require 'yaml'

def load_library(file)
  # code goes here
  emoticon_library = {}

  emoticons_hash = YAML.load_file(file)

  emoticons_hash.each do |meaning, emoticons|
    emoticon_library["get_meaning"] ||= {}
    emoticon_library["get_emoticon"] ||= {}
    emoticon_library["get_meaning"][emoticons[1]] = meaning
    emoticon_library["get_emoticon"][emoticons[0]] = emoticons[1]
  end

   emoticon_library
end

def get_japanese_emoticon(file, emoticon)
  # code goes here
  emoticon_library = load_library(file)
  if emoticon_library["get_emoticon"].has_key?(emoticon)
    emoticon_library["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, emoticon)
  # code goes here
  emoticon_library = load_library(file)
  if emoticon_library["get_meaning"].has_key?(emoticon)
    emoticon_library["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

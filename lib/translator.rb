# require modules here
require "yaml"

def get_emoticon(library)
  emoticon = {}
  library.each do |meaning, emoticons|
    english = emoticons[0]
    japanese = emoticons[1]
    emoticon[english] = emoticons[1]
    emoticon[japanese] = meaning
  end
  emoticon
end

def get_meaning(library)
  meanings = {}
  library.each do |meaning, emoticons|
    english = emoticons[0]
    japanese = emoticons[1]
    meanings[english] = meaning
    meanings[japanese] = meaning
  end
  meanings
end

def load_library(path)
  # code goes here
  library = YAML.load_file(path)
  {
    "get_emoticon" => get_emoticon(library),
    "get_meaning" => get_meaning(library)
  }
end

def get_japanese_emoticon(path, emoticon)
  library = load_library(path)
  if library["get_emoticon"].include?(emoticon)
    library["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticon)
  library = load_library(path)
  if library["get_meaning"].include?(emoticon)
    library["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

require 'yaml'
require 'pry'
# require modules here

def load_library(filepath)
  library = YAML.load_file(filepath)

  hash = { "get_meaning" => {}, "get_emoticon" => {} }
  library.each {|type, emoticons|

    hash["get_meaning"][emoticons[1]] = type
    hash["get_emoticon"][emoticons[0]] = emoticons[1]
  }
  hash
end

def get_japanese_emoticon(filepath, emoticon)
  library = load_library(filepath)
  jap = ""
  if library["get_emoticon"][emoticon]
    library["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(filepath, emoticon)
  library = load_library(filepath)
  if library["get_meaning"][emoticon]
    library["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

require "yaml"
require "pry"

def load_library(file_path)
  file = YAML.load_file(file_path)
  library = {"get_meaning" => {}, "get_emoticon" => {} }
  file.each do |meaning, emoticons|
    library["get_meaning"][emoticons[1]] = meaning
    library["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  library
end

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  if library["get_emoticon"][emoticon]
    output = library["get_emoticon"][emoticon]
  else
    output =  "Sorry, that emoticon was not found"
  end
  output
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  if library["get_meaning"][emoticon]
    output = library["get_meaning"][emoticon]
  else
    output =  "Sorry, that emoticon was not found"
  end
  output
end

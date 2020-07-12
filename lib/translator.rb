# require modules here
require "yaml"

def load_library(file_path)
  # code goes here
  library_array = { "get_emoticon" => {}, "get_meaning" => {} }
  YAML.load_file(file_path).each do |meaning, array|
  japanese = array[1]
  english = array[0]
  library_array["get_emoticon"][english] = japanese
  library_array["get_meaning"][japanese] = meaning
end
library_array
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  library = load_library(file_path)["get_emoticon"][emoticon]

  if (library)
     return library
  else
     return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  # code goes here
 h = load_library(file_path)["get_meaning"][emoticon]
  if(h)
    return h
  else
    return "Sorry, that emoticon was not found"
  end
end
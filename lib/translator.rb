require 'yaml'

def load_library(file_path)
  file = YAML.load_file(file_path)
  library = {
    "get_emoticon" => {},
    "get_meaning" => {}
  }
  file.each do |meaning, emoticon_array|
    library["get_emoticon"][emoticon_array[0]] = emoticon_array[1]
    library["get_meaning"][emoticon_array[1]] = meaning
  end
  library
end

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  library["get_emoticon"].find do |english, japanese|
    return japanese if english == emoticon
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  library["get_meaning"].find do |japanese, meaning|
    return meaning if japanese == emoticon
  end
  "Sorry, that emoticon was not found"
end

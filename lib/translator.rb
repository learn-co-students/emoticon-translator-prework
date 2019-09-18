# require modules here
require 'yaml'

def load_library(filename)
  library = YAML.load_file(filename)
  result = {"get_meaning" => {}, "get_emoticon" => {}}
  library.each do |meaning, emoticon|
    japanese = emoticon[1]
    english = emoticon[0]

    result["get_meaning"][japanese] = meaning
    result["get_emoticon"][english] = japanese
  end
  return result
end

def get_japanese_emoticon(filename, english_emoticon)
  library = load_library(filename)
  japanese_emoticon = library["get_emoticon"][english_emoticon]

  japanese_emoticon == nil ? "Sorry, that emoticon was not found" : japanese_emoticon
end

def get_english_meaning(filename, japanese_emoticon)
  library = load_library(filename)
  meaning = library["get_meaning"][japanese_emoticon]

  meaning == nil ? "Sorry, that emoticon was not found" : meaning
end

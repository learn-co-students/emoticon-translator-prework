# require modules here
require 'pry'
require 'yaml'

def load_library(emoticon_file)
  library = YAML.load_file(emoticon_file)
  emoticons = {"get_meaning" => {}, "get_emoticon" => {}}
  library.each do |definition,emoticon|
    english = emoticon[0]
    japanese = emoticon[1]
    emoticons["get_meaning"][japanese] = definition
    emoticons["get_emoticon"][english] = japanese
  end
emoticons
end

def get_japanese_emoticon(emoticon_file, eng_emoticon)
  library = load_library(emoticon_file)
    if library["get_emoticon"].include?(eng_emoticon)
      library["get_emoticon"][eng_emoticon]
    else
      "Sorry, that emoticon was not found"
    end
end

def get_english_meaning(emoticon_file, jap_emoticon)
  library = load_library(emoticon_file)
    if library["get_meaning"].include?(jap_emoticon)
        library["get_meaning"][jap_emoticon]
    else
      "Sorry, that emoticon was not found"
    end
end

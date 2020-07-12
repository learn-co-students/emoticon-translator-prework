require "yaml"

def load_library(file)
  emoticons = YAML.load_file(file)
  emoticon_library = {
    'get_meaning' => {},
    'get_emoticon' => {}
  }
  emoticons.each do |meaning,emoticon|
    eng = emoticon[0]
    jpn = emoticon[1]
    emoticon_library['get_meaning'][jpn]= meaning
    emoticon_library['get_emoticon'][eng] = jpn
  end
  emoticon_library
end

def get_japanese_emoticon(file, emoticon)
  library = load_library(file)
  result = library['get_emoticon'][emoticon]
  result ? result : "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emoticon)
  library = load_library(file)
  result = library['get_meaning'][emoticon]
  result ? result : "Sorry, that emoticon was not found"
end

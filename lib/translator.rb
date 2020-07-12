require 'pry'
require 'yaml'


def load_library(file)
  emoticons = YAML.load_file(file)
  emoticon_library = {
    'get_meaning' => {},
    'get_emoticon' => {}
  }
  emoticons.each do |meaning, icons|
    # puts "#{meaning}: #{icons}"
    english = icons[0]
    japanese = icons[1]
    emoticon_library['get_meaning'][japanese] = meaning
    emoticon_library['get_emoticon'][english] = japanese
  end
  emoticon_library
  # binding.pry
end

def get_japanese_emoticon(file_path, emoticon)
  lib = load_library(file_path)
  result = lib['get_emoticon'][emoticon]

  result ? result : "Sorry, that emoticon was not found"
  # binding.pry
end

def get_english_meaning(file_path, emoticon)
  lib = load_library(file_path)
  result = lib['get_meaning'][emoticon]

  result ? result : "Sorry, that emoticon was not found"
end

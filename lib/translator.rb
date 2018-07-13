require 'pry'
require 'yaml'


def load_library(file)
  # code goes here
  emoticons = YAML.load_file(file)
  lib = {
    'get_meaning' => {},
    'get_emoticon' => {}
  }
  emoticons.each do |meaning, icons|
    english = icons[0]
    japanese = icons[1]
    lib['get_meaning'][japanese] = meaning
    lib['get_emoticon'][english] = japanese
  end
  lib
  # binding.pry

end

def get_japanese_emoticon(file_path, emoticon)
  lib = load_library(file_path)
  japanese = lib['get_emoticon'][emoticon]

  japanese ? japanese : "Sorry, that emoticon was not found"

  # binding.pry
end

def get_english_meaning(file_path, emoticon)
  lib = load_library(file_path)
  english = lib['get_meaning'][emoticon]
  english ? english : "Sorry, that emoticon was not found"
end

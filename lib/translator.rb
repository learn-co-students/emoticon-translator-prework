# require modules here
require "yaml"


def load_library(file)
  emoticons = YAML.load_file(file)
  new_hash = {
    'get_meaning' => {},
    'get_emoticon' => {}
  }
  emoticons.each do |key, value|
    x = value[0]
    y = value[1]
    new_hash['get_meaning'][y]= key
    new_hash['get_emoticon'][x] = y
  end
    new_hash
end


def get_japanese_emoticon(file, emoticon)
#   library = load_library(file)
#   result = library['get_emoticon'][emoticon]
#   result ? result : "Sorry, that emoticon was not found"
  reference = load_library(file)
  emoji = reference['get_emoticon'][emoticon]
  emoji ? emoji : "Sorry, that emoticon was not found"

end

def get_english_meaning(file, emoticon)
  reference = load_library(file)
  emoji = reference['get_meaning'][emoticon]
  emoji ? emoji : "Sorry, that emoticon was not found"

end

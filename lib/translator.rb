# require modules here
require 'pry'
require 'yaml'

def load_library(file)
  # array from YAML file
  emoticons = YAML.load_file(file)
  #hash that will serve as base
  library = {
    'get_meaning' => {},
    'get_emoticon' => {}
  }
  #iterate through each emoticons to put meaning to text
  emoticons.each do |meaning, text|
    #binding.pry
    emoticon_eng = text[0]
    emoticon_jp = text[1]

    library['get_meaning'][emoticon_jp] = meaning
    #this way, he can see the emoticon, and translate it to plain old english
    library['get_emoticon'][emoticon_eng] = emoticon_jp
    #this way, he can use the emoticon he knows, and translate it to 'japanese'
  end
  #binding.pry
  library
end
#yaml files are at a base level easier to deal with syntax-wise

def get_japanese_emoticon(file, emoticon)
  # code goes here
  library = load_library(file)

  if library['get_emoticon'].include?(emoticon)
    library['get_emoticon'][emoticon]
  else
    "Sorry, that emoticon was not found"
  end

end

def get_english_meaning (file, emoticon)
  # code goes here
  library = load_library(file)

  if library['get_meaning'].include?(emoticon)
    library['get_meaning'][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

require 'pry'
require 'yaml'


def load_library(path)
  #grab emoticon array from yml
  emoticons = YAML.load_file("lib/emoticons.yml")

  #create hash to store emoticons
  library = {
    "get_meaning" =>  {},
    "get_emoticon" => {}
  }

  #loop through emoticons
  emoticons.each do |word, emoticon_array|
    #set each get_meaning key to japanese emoticon and point it
    #to the enlish word
    japanese_emoticon = emoticon_array[1]
    library["get_meaning"][japanese_emoticon] = word

    #set each get_emoticon key to english emoticon and point it
    #to the japanese emoticon
    english_emoticon = emoticon_array[0]
    library["get_emoticon"][english_emoticon] = japanese_emoticon
  end

#return new library of emoticons and english meanings
library
end

def get_japanese_emoticon(path, emoticon)
  #grab the emoticon hash of meanings from load library
  library = load_library(path)

  #grab the japanese emoticon fromt he "get_emotion" hash
  japanese_emoticon = library["get_emoticon"][emoticon]

  #return japanese emotion, or error message if value is nil
  japanese_emoticon == nil ? "Sorry, that emoticon was not found" : japanese_emoticon
end

def get_english_meaning(path, emoticon)
  #grab the emoticon hash of meanings from load library
  library = load_library(path)

  #grab the japanese emoticon fromt he "get_emotion" hash
  english_emoticon = library["get_meaning"][emoticon]

  #return japanese emotion, or error message if value is nil
  english_emoticon == nil ? "Sorry, that emoticon was not found" : english_emoticon
end


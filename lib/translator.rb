require 'yaml'
require 'pry'
def load_library(path)
  emoticons = YAML.load_file(path)
  hash = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticons.each do |word, array_of_symbols|
    array_of_symbols.each do |element|
      hash["get_meaning"][array_of_symbols[1]] = word
      hash["get_emoticon"][array_of_symbols[0]] = array_of_symbols[1]
    end
  end
hash
end

def get_japanese_emoticon(path, emoticon)
load_library(path)
end

def get_english_meaning(path, emoticon)
  
end
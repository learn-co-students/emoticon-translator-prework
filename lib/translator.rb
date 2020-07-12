require 'yaml'
require 'pry'

def load_library(path)
  file = YAML.load_file(path)
  hash = {"get_meaning" => {}, "get_emoticon" => {}}

  file.each do |meaning, array|
    hash["get_meaning"][array[1]] = meaning
    hash["get_emoticon"][array[0]] = array[1]
  end

  hash
end

def get_japanese_emoticon(path, emoticon)
  hash = load_library(path)
  if hash["get_emoticon"][emoticon] == nil
      return "Sorry, that emoticon was not found"
    else return hash["get_emoticon"][emoticon]
    end
  end


def get_english_meaning(path, emoticon)
  hash = load_library(path)
  if hash["get_meaning"][emoticon] == nil
      return "Sorry, that emoticon was not found"
    else return hash["get_meaning"][emoticon]
    end
end

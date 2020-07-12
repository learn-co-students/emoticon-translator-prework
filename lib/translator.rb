require 'yaml'
require 'pry'

def load_library(file)
  hash = YAML.load_file(file)

  variable = {
    "get_emoticon" => {},
    "get_meaning" => {}
  }

  hash.each do |key, value|
    variable["get_emoticon"][value[0]] = value[1]

    variable["get_meaning"][value[1]] = key

  end
variable
end

def get_japanese_emoticon(file, emoticon)
  hash = load_library(file)
  if hash["get_emoticon"][emoticon]
      hash["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end



def get_english_meaning(file, emoticon)
  hash = load_library(file)
  if hash["get_meaning"][emoticon]
      hash["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end 

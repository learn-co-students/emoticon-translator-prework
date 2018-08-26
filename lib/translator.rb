# require modules here
require "yaml"

def load_library(path)
    # code goes here
    trans = {}
    lib = YAML.load_file(path)
    # puts lib

    trans["get_meaning"] = {}
    trans["get_emoticon"] = {}
    # puts trans
    #doesnt handle duplicates
    lib.each do |meaning,symbols|
        trans["get_meaning"][symbols[1]] = meaning
        trans["get_emoticon"][symbols[0]] = symbols[1]
    end
    # puts trans



    trans
end

def get_japanese_emoticon(path,emoticon)
  # code goes here
  trans = load_library(path)
  if !trans["get_emoticon"].has_key?(emoticon)
      "Sorry, that emoticon was not found"
  else
      trans["get_emoticon"][emoticon]
  end
end

def get_english_meaning(path,emoticon)
  # code goes here
   trans = load_library(path)
   if !trans["get_meaning"].has_key?(emoticon)
       "Sorry, that emoticon was not found"
   else
       trans["get_meaning"][emoticon]
   end
end

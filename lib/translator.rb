# require modules here
require "yaml"


def load_library(j_emotes)
  transl = {"get_meaning" => {}, "get_emoticon" => {}}
  data = YAML.load_file(j_emotes)
  data.each_pair do |key, value|
    transl["get_meaning"][value[1]] = key
    transl["get_emoticon"][value[0]] = value[1]
  end
  return transl
end

def get_japanese_emoticon(path, emoticon)
  # code goes here
  load_library(path)["get_emoticon"].each_pair do |key, value| 
    if key == emoticon
      return value
    end
  end
   return "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  # code goes here
  load_library(path)["get_meaning"].each_pair do |key, value| 
    if key == emoticon
      return value
    end
  end
   return "Sorry, that emoticon was not found"
end

get_japanese_emoticon("./lib/emoticons.yml", "=D")


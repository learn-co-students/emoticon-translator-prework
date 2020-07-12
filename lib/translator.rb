# require modules here
require "yaml"


def load_library(path)
  # code goes here
   file_path = {}
   file = YAML.load_file(path)
   get_meaning = {}
   get_emoticon = {}
   file.each do |key, value|
     get_meaning[(value[1])] = key
     get_emoticon[(value[0])] =value[1]
   end
   file_path["get_meaning"] = get_meaning
   file_path["get_emoticon"] = get_emoticon
   file_path
 end
   
   

def get_japanese_emoticon(path, emoticon)
  # code goes here
  file = load_library(path)
   if file["get_emoticon"].keys.include?(emoticon)
     return file["get_emoticon"][emoticon]
   else
     "Sorry, that emoticon was not found"
   end
end



def get_english_meaning(path, emoticon)
  # code goes here
  file = load_library(path)
  if file["get_meaning"].keys.include?(emoticon)
     return file["get_meaning"][emoticon]
   else
     "Sorry, that emoticon was not found"
   end
end
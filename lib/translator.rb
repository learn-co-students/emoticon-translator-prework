 require 'yaml'

def load_library(path)
library = YAML.load_file(path)

myemoticons = {}
mymeanings = {}

library.each do |englishWord, emoticons|
  english_emoticon = emoticons[0]
  japanese_emoticon = emoticons[1]
  
  mymeanings[japanese_emoticon] = englishWord
  myemoticons[english_emoticon] = japanese_emoticon
end

mylibrary = { "get_emoticon" => myemoticons, "get_meaning" => mymeanings }
end

def get_japanese_emoticon(path, emoticon)
mylibrary = load_library(path)

if mylibrary["get_emoticon"].keys.include? emoticon
  mylibrary["get_emoticon"][emoticon]
else
  "Sorry, that emoticon was not found"
end

#japanese_emoticon = mylibrary["get_emoticon"][emoticon]
#if japanese_emoticon != NIL
#  return japanese_emoticon
#else
#  return "Sorry, that emoticon was not found"
#end

end

def get_english_meaning(path, emoticon)
mylibrary = load_library(path)

if mylibrary["get_meaning"].keys.include? emoticon
  mylibrary["get_meaning"][emoticon]
else
  "Sorry, that emoticon was not found"
end
end



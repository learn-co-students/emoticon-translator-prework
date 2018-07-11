require "yaml"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  hash = {"get_meaning" => {}, "get_emoticon" => {}}

  emoticons.each {|name, emoticon| #puts "lvl 1 #{name} & #{emoticon}." 
    emoticon.each {|array| #puts "lvl 2 #{array}."
    hash["get_meaning"][emoticon[1]]=name
    hash["get_emoticon"][emoticon[0]]= emoticon[1]
  }}
 hash
  
end


def get_japanese_emoticon(file_path, emoticon)
  reference = load_library(file_path)
  array = []
  
  reference.each {|name, emojis| emojis.each {|key, value| #puts 
    if key == emoticon
        array << value 
    end }}
 
  if array.empty?
    "Sorry, that emoticon was not found"
  else 
    array[0]  
  end
end

def get_english_meaning(file_path, emoticon )
  reference = load_library(file_path)
  array = []
  
  reference.each {|name, emojis| emojis.each {|key, value| 
    if key == emoticon
        array << value 
    end }}
 
  if array.empty?
    "Sorry, that emoticon was not found"
  else 
    array[0]  
  end
end
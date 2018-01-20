# require modules here
require "yaml"

def load_library(file_to_load)
  # code goes here
  # emoticons = YAML.load_file('lib/emoticons.yml')
  emoticons = YAML.load_file(file_to_load)
  # puts emoticons
  emoticons
end

def get_japanese_emoticon
  # code goes here
end

def get_english_meaning
  # code goes here
end


# x = load_library
# puts x
x= load_library("lib/emoticons.yml")
puts x["get_meaning"]["o_O"]
puts x["get_meaning"]["\u261C(\u2312\u25BD\u2312)\u261E"]
y= x["get_emoticon"]["O:)"]
x.each do |k,v|
  # puts "#{k}::#{v}"
  v.each do |subk,subv|
    puts "#{subk}::#{subv}"
  end
end
# puts y.is_array?

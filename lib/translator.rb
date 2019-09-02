# require modules here
require "yaml"

def load_library(file_to_load)
  # code goes here
  # emoticons = YAML.load_file('lib/emoticons.yml')
  emoticons = YAML.load_file(file_to_load)
  # puts emoticons
  emoticons
end

def get_japanese_emoticon(yaml_path,emoticon)
  emoticons = load_library(yaml_path)
  found = emoticons["get_emoticon"][emoticon]
  !found.nil? ? found : "Sorry, that emoticon was not found"
end

def get_english_meaning(yaml_path,emoticon)
  emoticons=load_library(yaml_path)
  # emoticon = "（＾ｖ＾）"#test
  # puts "Did not find #{emoticon}" if emoticons["get_meaning"][emoticon].nil?
  found = emoticons["get_meaning"][emoticon]
  # found = emoticons["get_meaning"]
  # puts "************************found:#{found}"
  # puts "************************emoticon:#{emoticon}"
  # puts "************************emoticon:#{emoticon.to_s}"
  # puts emoticons["get_emoticon"][":)"]
  # emoticons["get_meaning"].each do |k, v |
  #   puts "#{k}::#{v}"
  # end
  !found.nil? ? found : "Sorry, that emoticon was not found"
end


# x = load_library
# puts x
x= load_library("lib/emoticons.yml")
puts x["get_meaning"]["（＾ｖ＾）"]
puts x["get_meaning"]["o_O"]
puts x["get_meaning"]["\u261C(\u2312\u25BD\u2312)\u261E"]
y= x["get_emoticon"]["O:)"]
# x.each do |k,v|
#   # puts "#{k}::#{v}"
#   v.each do |subk,subv|
#     puts "#{subk}::#{subv}"
#   end
# end
# puts y.is_array?

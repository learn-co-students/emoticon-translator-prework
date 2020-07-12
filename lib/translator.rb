require 'pry'

def load_library(file_path)
  require "yaml"
  emoticon_hash = Hash.new
  emoticon = YAML.load_file(file_path)
  emoticon_hash.merge!("get_meaning" => {}, "get_emoticon" => {})
  emoticon.each do |key_word, value_emoticon|
    emoticon_hash["get_meaning"].merge!(value_emoticon[1] => key_word)
    emoticon_hash["get_emoticon"].merge!(value_emoticon[0] => value_emoticon[1])
  end
  emoticon_hash
end
=begin
{"angel"=>["O:)", "☜(⌒▽⌒)☞"],
 "angry"=>[">:(", "ヽ(ｏ`皿′ｏ)ﾉ"],
 "bored"=>[":O", "(ΘεΘ;)"],
 "confused"=>["%)", "(゜.゜)"],
 "embarrased"=>[":$", "(#^.^#)"],
 "fish"=>["><>", ">゜))))彡"],
 "glasses"=>["8D", "(^0_0^)"],
 "grinning"=>["=D", "(￣ー￣)"],
 "happy"=>[":)", "(＾ｖ＾)"],
 "kiss"=>[":*", "(*^3^)/~☆"],
 "sad"=>[":'(", "(Ｔ▽Ｔ)"],
 "surprised"=>[":o", "o_O"],
 "wink"=>[";)", "(^_-)"]}
=end

def get_japanese_emoticon(file_path, emoticon_case)
  library = load_library(file_path)
  library["get_emoticon"].each do |japanese_emoticon, english_emoticon|
         return english_emoticon if japanese_emoticon == emoticon_case
  end
  if library["get_emoticon"].none? {|japanese_emoticon, english_emoticon| japanese_emoticon == emoticon_case }
    return "Sorry, that emoticon was not found"
  end
end


def get_english_meaning(file_path, emoticon_case)
  library = load_library(file_path)
  library["get_meaning"].each do |japanese_emoticon, english_meaning|
         return english_meaning if japanese_emoticon == emoticon_case
  end
  if library["get_meaning"].none? {|japanese_emoticon, english_meaning| japanese_emoticon == emoticon_case }
    return "Sorry, that emoticon was not found"
  end
end

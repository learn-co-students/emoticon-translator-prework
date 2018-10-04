require "yaml"
require "pry"

def load_library(file_path)
  emoji = YAML.load_file(file_path)
  new_emoji_hash = { 
    "get_meaning" => {}, 
    "get_emoticon" => {} 
  }
  
  emoji.each do | meaning , emoji_array |
      new_emoji_hash["get_meaning"][emoji_array[1]] = meaning
      new_emoji_hash["get_emoticon"][emoji_array[0]] = emoji_array[1]
    end
  new_emoji_hash
  #binding.pry
end

# {"angel"=>["O:)", "☜(⌒▽⌒)☞"],
# "angry"=>[">:(", "ヽ(ｏ`皿′ｏ)ﾉ"],
# "bored"=>[":O", "(ΘεΘ;)"],
# "confused"=>["%)", "(゜.゜)"],
# "embarrased"=>[":$", "(#^.^#)"],
# "fish"=>["><>", ">゜))))彡"],
# "glasses"=>["8D", "(^0_0^)"],
# "grinning"=>["=D", "(￣ー￣)"],
# "happy"=>[":)", "(＾ｖ＾)"],
# "kiss"=>[":*", "(*^3^)/~☆"],
# "sad"=>[":'(", "(Ｔ▽Ｔ)"],
# "surprised"=>[":o", "o_O"],
# "wink"=>[";)", "(^_-)"]}

# new_emoji_hash:

# {"get_meaning"=>
#   {"☜(⌒▽⌒)☞"=>"angel",
#   "ヽ(ｏ`皿′ｏ)ﾉ"=>"angry",
#   "(ΘεΘ;)"=>"bored",
#   "(゜.゜)"=>"confused",
#   "(#^.^#)"=>"embarrased",
#   ">゜))))彡"=>"fish",
#   "(^0_0^)"=>"glasses",
#   "(￣ー￣)"=>"grinning",
#   "(＾ｖ＾)"=>"happy",
#   "(*^3^)/~☆"=>"kiss",
#   "(Ｔ▽Ｔ)"=>"sad",
#   "o_O"=>"surprised",
#   "(^_-)"=>"wink"},
# "get_emoticon"=>
#   {"O:)"=>"☜(⌒▽⌒)☞",
#   ">:("=>"ヽ(ｏ`皿′ｏ)ﾉ",
#   ":O"=>"(ΘεΘ;)",
#   "%)"=>"(゜.゜)",
#   ":$"=>"(#^.^#)",
#   "><>"=>">゜))))彡",
#   "8D"=>"(^0_0^)",
#   "=D"=>"(￣ー￣)",


def get_japanese_emoticon(file_path, emoticon)
   new_emoji_hash = load_library(file_path)
   
   if new_emoji_hash["get_emoticon"].include?(emoticon)
       return new_emoji_hash["get_emoticon"][emoticon]
   else
     return "Sorry, that emoticon was not found"
   end
end

def get_english_meaning(file_path, emoticon)
   new_emoji_hash = load_library(file_path)
   
   if new_emoji_hash["get_meaning"].include?(emoticon)
       return new_emoji_hash["get_meaning"][emoticon]
   else
     return "Sorry, that emoticon was not found"
   end
end







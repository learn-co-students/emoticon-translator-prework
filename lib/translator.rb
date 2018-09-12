# require modules here
require 'yaml'
require 'pry'
#    {"angel"=>["O:)", "☜(⌒▽⌒)☞"],
#     "angry"=>[">:(", "ヽ(ｏ`皿′ｏ)ﾉ"],
#     "bored"=>[":O", "(ΘεΘ;)"],
#     "confused"=>["%)", "(゜.゜)"],
#     "embarrased"=>[":$", "(#^.^#)"],
#     "fish"=>["><>", ">゜))))彡"],
#     "glasses"=>["8D", "(^0_0^)"],
#     "grinning"=>["=D", "(￣ー￣)"],
#     "happy"=>[":)", "(＾ｖ＾)"],
#     "kiss"=>[":*", "(*^3^)/~☆"],
#     "sad"=>[":'(", "(Ｔ▽Ｔ)"],
#     "surprised"=>[":o", "o_O"],
#     "wink"=>[";)", "(^_-)"]}
def load_library(file_path) # (./lib/emoticons.yml)
  # code goes here
  emoticons_hash = YAML.load_file(file_path)
  #using the emoticons_hash i need to create a new hash with 2 keys ('get_meaning'=>{japanese_emoticon=>english names} & 'get_emoticon'=>{english_emoticon=>equivalent_japanese_emoticon})
  library_hash = {'get_meaning'=>{}, 'get_emoticon'=>{}}
  emoticons_hash.each do |name, emoticon_array| # |"angel", ["O:)", "☜(⌒▽⌒)☞"]|
    library_hash['get_meaning'][emoticon_array[1]] ||= name
    library_hash['get_emoticon'][emoticon_array[0]] ||= emoticon_array[1]
    # at this pt library_hash = {"get_meaning"=>{"☜(⌒▽⌒)☞"=>"angel"}, "get_emoticon"=>{"O:)"=>"☜(⌒▽⌒)☞"}}
  end
  library_hash
end
#library_hash =
#              {"get_meaning"=>
#                              {"☜(⌒▽⌒)☞"=>"angel",
#                               "ヽ(ｏ`皿′ｏ)ﾉ"=>"angry",
#                               "(ΘεΘ;)"=>"bored",
#                               "(゜.゜)"=>"confused",
#                               "(#^.^#)"=>"embarrased",
#                               ">゜))))彡"=>"fish",
#                               "(^0_0^)"=>"glasses",
#                               "(￣ー￣)"=>"grinning",
#                               "(＾ｖ＾)"=>"happy",
#                               "(*^3^)/~☆"=>"kiss",
#                               "(Ｔ▽Ｔ)"=>"sad",
#                               "o_O"=>"surprised",
#                               "(^_-)"=>"wink"},
#               "get_emoticon"=>
#                              {"O:)"=>"☜(⌒▽⌒)☞",
#                               ">:("=>"ヽ(ｏ`皿′ｏ)ﾉ",
#                               ":O"=>"(ΘεΘ;)",
#                               "%)"=>"(゜.゜)",
#                               ":$"=>"(#^.^#)",
#                               "><>"=>">゜))))彡",
#                               "8D"=>"(^0_0^)",
#                               "=D"=>"(￣ー￣)",
#                               ":)"=>"(＾ｖ＾)",
#                               ":*"=>"(*^3^)/~☆",
#                               ":'("=>"(Ｔ▽Ｔ)",
#                               ":o"=>"o_O",
#                               ";)"=>"(^_-)"}}
def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  library_hash = load_library(file_path)
  jap_ver_emoticon = nil
  library_hash["get_emoticon"].each do |eng_emot| # |["O:)", "☜(⌒▽⌒)☞"]|
    if library_hash["get_emoticon"].keys.include?(emoticon)
      if emoticon == eng_emot[0]
        jap_ver_emoticon = eng_emot[1]
      end
    else
      return "Sorry, that emoticon was not found"
    end
  end
  jap_ver_emoticon
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  library_hash = load_library(file_path)
  eng_meaning = nil
  library_hash["get_meaning"].each do |jap_emot| # |["☜(⌒▽⌒)☞", "angel"]|
    if library_hash["get_meaning"].keys.include?(emoticon)
      if emoticon == jap_emot[0]
        eng_meaning = jap_emot[1]
      end
    else
      return "Sorry, that emoticon was not found"
    end
  end
  eng_meaning
end

require 'yaml'
require 'pry'

{"get_meaning"=>
  {"☜(⌒▽⌒)☞"=>"angel",
   "ヽ(ｏ`皿′ｏ)ﾉ"=>"angry",
   "(ΘεΘ;)"=>"bored",
   "(゜.゜)"=>"confused",
   "(#^.^#)"=>"embarrased",
   ">゜))))彡"=>"fish",
   "(^0_0^)"=>"glasses",
   "(￣ー￣)"=>"grinning",
   "(＾ｖ＾)"=>"happy",
   "(*^3^)/~☆"=>"kiss",
   "(Ｔ▽Ｔ)"=>"sad",
   "o_O"=>"surprised",
   "(^_-)"=>"wink"},

 "get_emoticon"=>
  {"O:)"=>"☜(⌒▽⌒)☞",
   ">:("=>"ヽ(ｏ`皿′ｏ)ﾉ",
   ":O"=>"(ΘεΘ;)",
   "%)"=>"(゜.゜)",
   ":$"=>"(#^.^#)",
   "><>"=>">゜))))彡",
   "8D"=>"(^0_0^)",
   "=D"=>"(￣ー￣)",
   ":)"=>"(＾ｖ＾)",
   ":*"=>"(*^3^)/~☆",
   ":'("=>"(Ｔ▽Ｔ)",
   ":o"=>"o_O",
   ";)"=>"(^_-)"}
 }


def load_library(path)
  yaml_hash = YAML.load_file(path)
  library = {
    "get_meaning" => {},
    "get_emoticon" => {}
    }
    yaml_hash.each do |meaning, emo_array|
      library["get_meaning"][emo_array[1]] = meaning
      library["get_emoticon"][emo_array[0]] = emo_array[1]
    end
    library

end

def get_japanese_emoticon(path, emoticon)
  library = load_library(path)
  if library["get_emoticon"][emoticon]
    library["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticon)
  library = load_library(path)
  if library["get_meaning"][emoticon]
    library["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

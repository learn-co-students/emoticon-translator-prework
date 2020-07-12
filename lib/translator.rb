# require modules here
require "yaml"
emojisss= {"get_meaning"=>{"☜(⌒▽⌒)☞"=>"angel", "ヽ(ｏ`皿′ｏ)ﾉ"=>"angry", "(ΘεΘ;)"=>"bored",
  "(゜.゜)"=>"confused", "(#^.^#)"=>"embarrased", ">゜))))彡"=>"fish", "(^0_0^)"=>"glasses",
  "(￣ー￣)"=>"grinning", "(＾ｖ＾)"=>"happy", "(*^3^)/~☆"=>"kiss", "(Ｔ▽Ｔ)"=>"sad", "o_O"=>"surprised",
  "(^_-)"=>"wink"},
  "get_emoticon"=>{"O:)"=>"☜(⌒▽⌒)☞", ">:("=>"ヽ(ｏ`皿′ｏ)ﾉ", ":O"=>"(ΘεΘ;)", "%)"=>"(゜.゜)",
    ":$"=>"(#^.^#)", "><>"=>">゜))))彡", "8D"=>"(^0_0^)", "=D"=>"(￣ー￣)", ":)"=>"(＾ｖ＾)", ":*"=>"(*^3^)/~☆",
    ":'("=>"(Ｔ▽Ｔ)", ":o"=>"o_O", ";)"=>"(^_-)"}}

def load_library(path = "./lib/emoticons.yml")
  # code goes here
  emoticons = YAML.load_file(path)
  emoticons.each_with_object({"get_meaning"=>{}, "get_emoticon"=>{}}) { |(word, emojis), result|
    result["get_meaning"][emojis[1]] = word
    result["get_emoticon"][emojis[0]] = emojis[1]
  }
end


def get_japanese_emoticon(path = "./lib/emoticons.yml", eng_emoji)
  # code goes here
  emoticon_hash = load_library(path)
  emoticon_hash["get_emoticon"].each { |eng, jap|
    return jap if eng_emoji == eng
  }
  return "Sorry, that emoticon was not found"
end

puts get_japanese_emoticon("./lib/emoticons.yml", "=D")

def get_english_meaning(path = "./lib/emoticons.yml", jap_emoji)
  # code goes here
  emoticon_hash = load_library(path)
  emoticon_hash["get_meaning"].each { |emoji, meaning|
    return meaning if emoji == jap_emoji
  }
  return "Sorry, that emoticon was not found"
end

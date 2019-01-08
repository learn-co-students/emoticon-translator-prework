require "yaml"
require "pry"

def load_library(file_path)
  new_hash = {
    "get_meaning" => {
      "☜(⌒▽⌒)☞" => "angel",
      "ヽ(ｏ`皿′ｏ)ﾉ" => "angry",
      "(ΘεΘ;)" => "bored",
      "(゜.゜)" => "confused",
      "(#^.^#)" => "embarrased",
      ">゜))))彡" => "fish",
      "(^0_0^)" => "glasses",
      "(￣ー￣)" => "grinning",
      "(＾ｖ＾)" => "happy",
      "(*^3^)/~☆" => "kiss",
      "(Ｔ▽Ｔ)" => "sad",
      "o_O" => "surprised",
      "(^_-)" => "wink"
    },
    "get_emoticon" => {
      "O:)" => "☜(⌒▽⌒)☞",
      ">:(" => "ヽ(ｏ`皿′ｏ)ﾉ",
      ":O" => "(ΘεΘ;)",
      "%)" => "(゜.゜)",
      ":$" => "(#^.^#)",
      "><>" => ">゜))))彡",
      "8D" => "(^0_0^)",
      "=D" => "(￣ー￣)",
      ":)" => "(＾ｖ＾)",
      ":*" => "(*^3^)/~☆",
      ":'(" => "(Ｔ▽Ｔ)",
      ":o" => "o_O",
      ";)" => "(^_-)",
    }
  }

  return new_hash
end

def get_japanese_emoticon(yml, emoticon)
  lib = load_library(yml)

  lib.each do |get, emoticon_hash|
    if get == "get_emoticon"
      if emoticon_hash.include?(emoticon)
        return emoticon_hash[emoticon]
      elsif !emoticon_hash.include?(emoticon)
        return "Sorry, that emoticon was not found"
      end
    end
  end
end

def get_english_meaning(yml, emoticon)
  lib = load_library(yml)

  lib.each do |get, emoticon_hash|
    # binding.pry
    if get == "get_meaning"
      if emoticon_hash.include?(emoticon)
        return emoticon_hash[emoticon]
      elsif !emoticon_hash.include?(emoticon)
        return "Sorry, that emoticon was not found"
      end
    end
  end
end

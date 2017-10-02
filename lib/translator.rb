require "yaml"
require "pry"

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

def load_library(path)
  reference = YAML.load_file(path)
  libraryHash = {"get_meaning" => {}, "get_emoticon" => {}}
  reference.each do
    |meaning, emoticonsArr|
    libraryHash["get_meaning"][emoticonsArr[1]] = meaning
    libraryHash["get_emoticon"][emoticonsArr[0]] = emoticonsArr[1]
  end
  return libraryHash
end

def get_japanese_emoticon(path, emoticon)
  hash = load_library(path)
  if hash["get_emoticon"].key?(emoticon)
    return hash["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticon)
  hash = load_library(path)
  if hash["get_meaning"].key?(emoticon)
    return hash["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

# require modules here
require "yaml"

def load_library(path)
  emo = YAML.load_file(path)
  #puts emo
  #{"angel"=>["O:)", "☜(⌒▽⌒)☞"], "angry"=>[">:(", "ヽ(ｏ`皿′ｏ)ﾉ"], "bored"=>[":O", "(ΘεΘ;)"], "confused"=>["%)", "(゜.゜)"], "embarrased"=>[":$", "(#^.^#)"], "fish"=>["><>", ">゜))))彡"], "glasses"=>["8D", "(^0_0^)"], "grinning"=>["=D", "(￣ー￣)"], "happy"=>[":)", "(＾ｖ＾)"], "kiss"=>[":*", "(*^3^)/~☆"], "sad"=>[":'(", "(Ｔ▽Ｔ)"], "surprised"=>[":o", "o_O"], "wink"=>[";)", "(^_-)"]}
  new_hash = {}
  new_hash["get_meaning"] = {}
  emo.map do |key,value|
    value.each do |mean|
      new_hash["get_meaning"][mean] = key
    end
  end
  new_hash["get_emoticon"] = {}
  emo.map do |key,value|
    eng = value.first
    jap = value[-1]
    new_hash["get_emoticon"][eng] = key
    new_hash["get_emoticon"][eng] = jap
  end
  return new_hash
end

def get_japanese_emoticon(path,emoticon)
  emo = YAML.load_file(path)
  hash = load_library(path)
  if !(hash["get_emoticon"][emoticon])
    "Sorry, that emoticon was not found"
  else
    hash["get_emoticon"][emoticon]
  end
end

def get_english_meaning(path,emoticon)
  emo = YAML.load_file(path)
  hash = load_library(path)
  if !(hash["get_meaning"][emoticon])
    "Sorry, that emoticon was not found"
  else
    hash["get_meaning"][emoticon]
  end
end

require "yaml"
require "pry"

def load_library(path)
  lib = YAML.load_file(path)
  dic = {"get_meaning" => {}, "get_emoticon" => {}}
  # get_meaning -> jp charas -> meanings
  # get_emoticon -> en charas -> jp charas

  lib.map do |meaning_sym, charas_ary|
    dic["get_meaning"][charas_ary[1]] = meaning_sym.to_s
    dic["get_emoticon"][charas_ary[0]] = charas_ary[1]
  end
  dic
end

def get_japanese_emoticon(path, charas_en)
  dic = load_library(path)
  if dic["get_emoticon"].has_key?(charas_en)
    dic["get_emoticon"][charas_en]
  else return "Sorry, that emoticon was not found"
  end
end


def get_english_meaning(path, charas_jp)
  dic = load_library(path)
  if dic["get_meaning"].has_key?(charas_jp)
    dic["get_meaning"][charas_jp]
  else return "Sorry, that emoticon was not found"
  end
end

# require modules here
require "yaml"
require "pry"

def load_library(path)
  # code goes here
  emoticons_lib = YAML.load_file(path)
  get_meaning = {"get_meaning" => {}}
  get_emoticon = {"get_emoticon" => {}}
  emoticons_lib.each do |meaning, emojis|
    get_meaning["get_meaning"][emojis[1]] ||= meaning
    get_emoticon["get_emoticon"][emojis[0]] ||= emojis[1]
  end
  get_meaning.merge!(get_emoticon)
end

def get_japanese_emoticon(path, emoticon)
  # code goes here
  emo_lib = load_library(path)
  if emo_lib["get_emoticon"][emoticon]
    emo_lib["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, jap_emoticon)
  # code goes here
  emo_lib = load_library(path)
  if emo_lib["get_meaning"][jap_emoticon]
    emo_lib["get_meaning"][jap_emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

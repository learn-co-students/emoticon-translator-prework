require "yaml"

def load_library(emoticons_yml)
  # code goes here
  emoticons = YAML.load_file('./lib/emoticons.yml')
emoticon_lib = {'get_meaning' => {}, 'get_emoticon' => {}}
emoticons.each do |meaning, value|
  english = value[0]
  japanese = value[1]
  emoticon_lib['get_meaning'][japanese] = meaning
  emoticon_lib['get_emoticon'][english] = japanese
end
emoticon_lib
end

def get_japanese_emoticon(emoticons_yml, emoticon)
  # code goes here
  emoticon_lib = load_library(emoticons_yml)
  japanese_emoticon = emoticon_lib['get_emoticon'][emoticon]
  japanese_emoticon ? japanese_emoticon : 'Sorry, that emoticon was not found'
end

def get_english_meaning(emoticons_yml, emoticon)
  emoticon_lib = load_library(emoticons_yml)
  english_emoticon = emoticon_lib['get_meaning'][emoticon]
  english_emoticon ? english_emoticon : 'Sorry, that emoticon was not found'
  # code goes here
end
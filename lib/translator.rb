# require modules here
require "yaml"

def load_library(file_path)
  translate_this = {"get_emoticon" => {}, "get_meaning" => {}}
  YAML.load_file(file_path).each do |translation, languages|
    english_emoticon = languages[0]
    japanese_emoticon = languages[1]
    translate_this["get_meaning"][languages[1]] = translation
    translate_this["get_emoticon"][languages[0]] = japanese_emoticon
  end
  translate_this
end

def get_japanese_emoticon(file_path, english_emoticon)
  translate = load_library(file_path)
  japanese_emoticon = translate["get_emoticon"][english_emoticon]
  translate["get_emoticon"].include?(english_emoticon) ? japanese_emoticon : "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, japanese_emoticon)
  translate = load_library(file_path)
  english_emoticon = translate["get_meaning"][japanese_emoticon]
  translate["get_meaning"].include?(japanese_emoticon) ? english_emoticon : "Sorry, that emoticon was not found"
end

# require modules here
require "pry"
require "yaml"

def load_library(file_path)
  result = Hash.new
  emoticon_yaml = YAML.load_file(file_path)

  result["get_meaning"] = Hash.new
  result["get_emoticon"] = Hash.new

  # emotes[0] is English, emotes[1] is Japanese
  emoticon_yaml.each do |meaning, emotes|
    result["get_meaning"][emotes[1]] = meaning
    result["get_emoticon"][emotes[0]] = emotes[1]
  end
  result
end

def get_japanese_emoticon(file_path, eng_emoticon)
  result = load_library(file_path)["get_emoticon"][eng_emoticon]
  result == nil ? "Sorry, that emoticon was not found" : result
end

def get_english_meaning(file_path, j_emoticon)
  result = load_library(file_path)["get_meaning"][j_emoticon]
  result == nil ? "Sorry, that emoticon was not found" : result
end

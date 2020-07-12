require 'yaml'
require 'pry'

def load_library(file_path)
  emo_yml = YAML.load_file(file_path)
  emo_values = {"get_emoticon" => {}, "get_meaning" => {}}
  emo_yml.each do |meaning, symbols|
    emo_values["get_meaning"][symbols[1]] = meaning
    emo_values["get_emoticon"][symbols[0]] = symbols[1]
  end
  emo_values
end

def get_japanese_emoticon(file_path, emotion)
  emotion_translator = load_library(file_path)
  if !emotion_translator["get_emoticon"][emotion]
    return "Sorry, that emoticon was not found"
  end
  emotion_translator["get_emoticon"][emotion]
end

def get_english_meaning(file_path, emotion)
  emotion_translator = load_library(file_path)
  if !emotion_translator["get_meaning"][emotion]
    return "Sorry, that emoticon was not found"
  end 
  emotion_translator["get_meaning"][emotion]
end

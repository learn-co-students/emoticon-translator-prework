require 'yaml'

def load_library(file_path)
  emotes = YAML.load_file(file_path)
  result = {"get_emoticon" => {}, "get_meaning" => {}}
  emotes.each do |meaning, emote_array|
    result["get_meaning"][emote_array[1]] = meaning
    result["get_emoticon"][emote_array[0]] = emote_array[1]
  end
  result
end

def get_japanese_emoticon(file_path, emote)
  emote_translator = load_library(file_path)
  emote_translator["get_emoticon"][emote] ? emote_translator["get_emoticon"][emote] : "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emote)
    emote_translator = load_library(file_path)
    emote_translator["get_meaning"][emote] ? emote_translator["get_meaning"][emote] : "Sorry, that emoticon was not found"
end

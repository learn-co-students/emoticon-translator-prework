# require modules here
require 'yaml'
require 'pry'

def load_library(file)
  library = YAML.load_file(file)
  emojis = {}
  emojis['get_meaning'] = emojis['get_emoticon'] = {}
  library.each do |emote,array|
    emojis['get_emoticon'][array[0]] = array[1]
    emojis['get_meaning'][array[1]] = emote
  end
  return emojis
end

def get_japanese_emoticon(file,emoticon)
  emojis = load_library(file)
  emoji = emojis['get_emoticon'][emoticon]
  emoji == nil ? 'Sorry, that emoticon was not found' : emoji
end

def get_english_meaning(file,emoticon)
  emojis = load_library(file)
  emoji = emojis['get_meaning'][emoticon]
  emoji == nil ? 'Sorry, that emoticon was not found' : emoji
end
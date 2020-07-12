# require modules here
require "yaml"
#emoticons = YAML.load_file('./lib/emoticons.yml')

def load_library(emoticons)
  # code goes here
  emoticons = YAML.load_file('./lib/emoticons.yml')
  translations = {}
  translations['get_meaning'] = {}
  translations['get_emoticon'] = {}
  emoticons.each do |name, emots|
    translations['get_meaning'][emots.last] = name
    translations['get_emoticon'][emots.first] = emots.last
  end
  translations
end

def get_japanese_emoticon(emoticons, emote)
  # code goes here
  dictionary = load_library(emoticons)
  if dictionary['get_emoticon'][emote] == nil
    "Sorry, that emoticon was not found"
  else
    dictionary['get_emoticon'][emote]
  end
end

def get_english_meaning(emoticons, emote)
  # code goes here
  dictionary = load_library(emoticons)
  if dictionary['get_meaning'][emote] == nil
    "Sorry, that emoticon was not found"
  else
    dictionary['get_meaning'][emote]
  end
end

require 'pry'
require "yaml"

def load_library(path)
  emotes = YAML.load_file('lib/emoticons.yml')

  myEmotes = {"get_meaning" => {}, "get_emoticon" => {}}
  emotes.each do |key, val|
    myEmotes["get_meaning"][val[1]] = key
    myEmotes["get_emoticon"][val[0]] = val[1]
  end
  return myEmotes
end

def get_japanese_emoticon(path, emote)
  myEmotes = load_library(path)
  jEmote = myEmotes["get_emoticon"][emote]

  if jEmote == nil
    jEmote = "Sorry, that emoticon was not found"
  end

  return jEmote
end

def get_english_meaning(path, emote)
  myEmotes = load_library(path)
  engEmote = myEmotes["get_meaning"][emote]

  if engEmote == nil
    engEmote = "Sorry, that emoticon was not found"
  end

  return engEmote
end

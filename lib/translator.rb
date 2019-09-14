# require modules here
require "yaml"
require "pry"

def load_library(filePath)
  newLib = {'get_meaning'=> {}, 'get_emoticon'=> {}}
  YAML.load_file(filePath).each {|emotion, emoticons|
    newLib['get_emoticon'][emoticons[0]] = emoticons[1]
    newLib['get_meaning'][emoticons[1]] = emotion.to_s
  }
  newLib
end

def get_japanese_emoticon(filePath, emoticon)
  con = "Sorry, that emoticon was not found"
  load_library(filePath)['get_emoticon'].each {|engEmoticon, japEmoticon| con = japEmoticon if engEmoticon == emoticon }
  con
end

def get_english_meaning(filePath, emoticon)
  con = "Sorry, that emoticon was not found"
  load_library(filePath)['get_meaning'].each {|japEmoticon, meaning| con = meaning if japEmoticon == emoticon }
  con
end

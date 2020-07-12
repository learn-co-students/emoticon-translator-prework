# require modules here
require "yaml"
require 'pry'

def load_library(file_path)
  # code goes here
  emoticons = YAML.load_file(file_path)
  emoticons_library = {
    "get_emoticon" => {}, 
    "get_meaning" => {}
  }
  
  emoticons.each do |emotion, emoticons|
    eng = emoticons[0]
    jpn = emoticons[1]
    emoticons_library["get_emoticon"][eng] = jpn
    emoticons_library["get_meaning"][jpn] = emotion
  end
  emoticons_library
end

def get_japanese_emoticon(file_path, eng_emoticon)
  # code goes here
  jpn_emoticon = load_library(file_path)["get_emoticon"][eng_emoticon]
  jpn_emoticon ? jpn_emoticon : "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, jpn_emoticon)
  # code goes here
  get_meaning = load_library(file_path)["get_meaning"][jpn_emoticon]
  get_meaning ? get_meaning : "Sorry, that emoticon was not found"
end
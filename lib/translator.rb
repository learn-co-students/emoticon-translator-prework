# require modules here
require 'pry'
require 'yaml'
def load_library(filepath)

  emoticons = YAML.load_file(filepath)
  emotions = {'get_meaning' => {} , 'get_emoticon' => {} }

emoticons.each do |word, emoji|
  emoji.each do |x|
    emotions['get_meaning'][x] = word
    emotions['get_emoticon'][x] = emoji[1]
  end
end


emotions
end

def get_japanese_emoticon(filepath, emoji)
  hash = load_library(filepath)
  if hash["get_emoticon"][emoji] == nil
    "Sorry, that emoticon was not found"
  else
    hash["get_emoticon"][emoji]
  end
end

def get_english_meaning(filepath, emoji)
  hash = load_library(filepath)
  if hash["get_meaning"][emoji] == nil
    "Sorry, that emoticon was not found"
  else
    hash["get_meaning"][emoji]
  end
end

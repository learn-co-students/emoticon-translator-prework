# require modules here
require "yaml"

def load_library(path="./lib/emoticons.yml")
  emot = YAML.load_file(path)
  new_hash = {'get_meaning'=>{}, 'get_emoticon'=>{}}
  emot.each do |meaning, val|
    new_hash['get_meaning'][val.last] = meaning
    new_hash['get_emoticon'][val.first] = val.last
  end
  new_hash
end

def get_japanese_emoticon(path, emot)
  dictionary = load_library(path)
  if dictionary['get_emoticon'].keys.include?(emot)
    dictionary['get_emoticon'][emot]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emot)
  dictionary = load_library(path)
  if dictionary['get_meaning'].keys.include?(emot)
    dictionary['get_meaning'][emot]
  else
    "Sorry, that emoticon was not found"
  end
end

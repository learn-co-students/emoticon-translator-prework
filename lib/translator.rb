require 'yaml'

def load_library(path)
  emoticons = YAML.load_file(path)

  emoticon_dictionary = {
    'get_meaning' => {},
    'get_emoticon' => {}
  }

  emoticons.each do |meaning, array|
    emoticon_dictionary['get_meaning'][array[1]] = meaning
    emoticon_dictionary['get_emoticon'][array[0]] = array[1]
  end
  emoticon_dictionary
end

def get_japanese_emoticon(path, emoticon)
  emotes = load_library(path)

  if emotes['get_emoticon'].keys.include?(emoticon)
    emotes['get_emoticon'][emoticon]
  else
    'Sorry, that emoticon was not found'
  end
end

def get_english_meaning(path, emoticon)
  emotes = load_library(path)

  if emotes['get_meaning'].keys.include?(emoticon)
    emotes['get_meaning'][emoticon]
  else
    'Sorry, that emoticon was not found'
  end
end

require "yaml"
emoticon_yaml = YAML.load_file('lib/emoticons.yml')

def load_library(yaml)
  emoticons = YAML.load_file(yaml)
  emots = {
    'get_meaning' => {},
    'get_emoticon' => {}
  }
  emoticons.each do |emoticon, array|
    emots['get_meaning'][array[1]] = emoticon
    emots['get_emoticon'][array[0]] = array[1]
  end
  emots
end

def get_japanese_emoticon(yaml, emoticon)
  emoticon_dictionary = load_library(yaml)
  get_emoticon = emoticon_dictionary['get_emoticon']
  get_emoticon.each do |english, japanese|
    if english == emoticon
      return japanese
    end
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(yaml, emoticon)
  emoticon_dictionary = load_library(yaml)
  get_meaning = emoticon_dictionary['get_meaning']
  get_meaning.each do |emot, meaning|
    if emot == emoticon
      return meaning
    end
  end
  "Sorry, that emoticon was not found"
end

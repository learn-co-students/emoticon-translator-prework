require 'yaml'

def load_library(emoticon_file)
  emoHash={'get_meaning' => {}, 'get_emoticon' => {}}
  YAML.load_file('./lib/emoticons.yml').each do |key, value|
     emoHash["get_meaning"][value[1]] = key
     emoHash["get_emoticon"][value[0]] = value[1]
  end
  emoHash
end

def get_japanese_emoticon(emoticon_file, emoticon)
  # code goes here
  hashy= load_library(emoticon_file)
  dictionary = hashy['get_emoticon']
  if dictionary.has_key?(emoticon)
    dictionary[emoticon]
      
   else
    "Sorry, that emoticon was not found"
      
    end
  end

def get_english_meaning(emoticon_file, emoticon)
  # code goes here
  hashy= load_library(emoticon_file)
  dictionary = hashy['get_meaning']
  if dictionary.has_key?(emoticon)
    dictionary[emoticon]
      
   else
    "Sorry, that emoticon was not found"
      
  
  end
end
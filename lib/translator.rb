require "yaml"


def load_library(path)
  emoticons = YAML.load_file(path)
  result={}
  result['get_meaning']={}
  result['get_emoticon']={}
  emoticons.each do |meaning,emoji|
    result['get_meaning'][emoji[1]]=meaning
    result['get_emoticon'][emoji[0]]=emoji[1]
  end
  result
end

def get_japanese_emoticon(path,emoji)
  e= load_library(path)
  if e['get_emoticon'][emoji].nil?
    return "Sorry, that emoticon was not found"
  else
     e['get_emoticon'][emoji]
  end
end

def get_english_meaning(path,emoticon)
   e= load_library(path)
  if e['get_meaning'][emoticon].nil?
    return "Sorry, that emoticon was not found"
  else
     e['get_meaning'][emoticon]
  end
end
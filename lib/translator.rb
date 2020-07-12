  
def load_library(file)
  require 'yaml'
  stuff=YAML.load_file(file)
  newhash={"get_meaning"=> {}, "get_emoticon" => {}}
  stuff.each do|meaning,emoticons|
    newhash["get_meaning"][emoticons[1]]=meaning
    newhash["get_emoticon"][emoticons[0]]=emoticons[1]
  end
  newhash
end
def get_japanese_emoticon(file,emoticon)
  answer=load_library(file)["get_emoticon"][emoticon]
  if answer.nil?
    "Sorry, that emoticon was not found"
  else answer
  end
end

def get_english_meaning(file,emoticon)
  answer=load_library(file)["get_meaning"][emoticon]
  if answer.nil?
    "Sorry, that emoticon was not found"
  else answer
  end
end

puts get_japanese_emoticon("./lib/emoticons.yml",":)")
require 'yaml'

def load_library(file)
  emoticons_file = YAML.load_file(file)
  japanese_emoticons = []
  emoticons_file.each do |meaning, emot_array|
    japanese_emoticons.push(emot_array[1])
  end
  
  english_emoticons = []
  emoticons_file.each do |meaning, emot_array|
    english_emoticons.push(emot_array[0])
  end
  
  meanings = []
  emoticons_file.each do |meaning, emot_array|
    meanings.push(meaning)
  end
  
  emoticons = {}
  emoticons["get_emoticon"] = {}
  emoticons["get_meaning"] = {}
  max_index = meanings.length - 1
  index = (0..max_index).to_a

  index.each do |i|
    emoticons["get_meaning"][japanese_emoticons[i]] = meanings[i]
    emoticons["get_emoticon"][english_emoticons[i]] = japanese_emoticons[i]
  end

  return emoticons
end


def get_japanese_emoticon(file, emoticon)
  emoticons = load_library(file)
  if emoticons["get_emoticon"].has_key? emoticon
    jap_emoticon = emoticons["get_emoticon"][emoticon]
    
  else 
   "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, emoticon)
  emoticons = load_library(file)
  if emoticons["get_meaning"].has_key? emoticon
    eng_meaning = emoticons["get_meaning"][emoticon]
    
  else 
   "Sorry, that emoticon was not found"
  end
end
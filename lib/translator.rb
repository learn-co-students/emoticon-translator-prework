require 'yaml'
emoticons = YAML.load_file('./lib/emoticons.yml')
#puts emoticons.inspect



def load_library(file_path)
  require 'yaml'
  emoticons = YAML.load_file(file_path)
  new_hash = {}
  emoticons.each do |label, emoticon|
    american_emoticon = emoticon[0]
    japanese_emoticon = emoticon[1]
    if new_hash.key?('get_meaning') == false
      new_hash['get_meaning']= {}
      new_hash['get_emoticon'] = {}
      new_hash['get_meaning'] = new_hash['get_meaning'].merge("#{japanese_emoticon}" => label)
      new_hash['get_emoticon'] = new_hash['get_emoticon'].merge("#{american_emoticon}"=> japanese_emoticon)
    else
      new_hash['get_meaning'][japanese_emoticon] = label
      new_hash['get_emoticon'][american_emoticon] = japanese_emoticon
    end
  end
  new_hash
end

def get_japanese_emoticon(file_path, emoticon)
  emoticon_hash = load_library(file_path)
  if emoticon_hash['get_emoticon'][emoticon] == nil
      "Sorry, that emoticon was not found"
  else
    emoticon_hash['get_emoticon'][emoticon]
  end
end

def get_english_meaning(file_path, emoticon)
  emoticon_hash = load_library(file_path)
  if emoticon_hash['get_meaning'][emoticon] == nil
    "Sorry, that emoticon was not found"
  else
    emoticon_hash['get_meaning'][emoticon]
  end
end

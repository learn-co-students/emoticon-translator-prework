require 'yaml'

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  emoticon_dictionary = {}
  emoticon_dictionary["get_meaning"] = {}
  emoticon_dictionary["get_emoticon"] = {}
  emoticons.each do |name, data|
    american_emoticon = data[0]
    japanese_emoticon = data[1]
    emoticon_dictionary["get_meaning"][japanese_emoticon] = name
    emoticon_dictionary["get_emoticon"][american_emoticon] = japanese_emoticon
  end
  emoticon_dictionary
end

def get_japanese_emoticon(file_path, emoticon)
  use_dictionary(file_path, emoticon, "get_emoticon")
end

def get_english_meaning(file_path, emoticon)
  use_dictionary(file_path, emoticon, "get_meaning")
end

def use_dictionary(file_path, emoticon, which_index)
  emoticon_dictionary = load_library(file_path)
  if emoticon_dictionary[which_index].keys.include? emoticon
    emoticon_dictionary[which_index][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end
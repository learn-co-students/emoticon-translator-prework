require "yaml"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  emoticons_dict = {}
  emoticons_dict["get_meaning"] = {}
  emoticons_dict["get_emoticon"] = {}
  emoticons.each do |meaning, emoticon_array|
    emoticons_dict["get_meaning"][emoticon_array[1]] = meaning
    emoticons_dict["get_emoticon"][emoticon_array[0]] = emoticon_array[1]
  end
  emoticons_dict
end

def get_japanese_emoticon(file_path, western_emoticon)
  return_value = "Sorry, that emoticon was not found"
  emoticons = load_library(file_path)
  emoticons.each do |dictionary, emoticon_hash|
    if dictionary == "get_emoticon"
      emoticon_hash.each do |english_emoticon, japanese_emoticon|
        #puts western_emoticon
        #puts english_emoticon
        if western_emoticon == english_emoticon
          return_value = japanese_emoticon
        end
      end
    end
  end 
  return_value
end 

puts get_japanese_emoticon("./lib/emoticons.yml", ":)")

def get_english_meaning(file_path, emoticon)
  return_value = "Sorry, that emoticon was not found"
  emoticons = load_library(file_path)
  emoticons.each do |dictionary, emoticon_hash|
    if dictionary == "get_meaning"
      emoticon_hash.each do |japanese_emoticon, meaning|
        if japanese_emoticon == emoticon
          return_value = meaning
        end
      end
    end
  end 
  return_value
end 

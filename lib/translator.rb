require "yaml"
require "pry"

def load_library(file_path)
  emo_hash = {}
  emoticons = YAML.load_file(file_path)
  emo_hash["get_meaning"] = {}
  emo_hash["get_emoticon"] = {}
  emoticons.each do |word, emotes|
      emo_hash["get_meaning"][emotes[1]] ||= word
      emo_hash["get_emoticon"][emotes[0]] ||= emotes[1]
    end
    emo_hash
  end
  
def get_japanese_emoticon(file_path, emoticon)
  emoticons = load_library(file_path)
    # if emoticons["get_emoticon"][emoticon] == emoticon
    if emoticons["get_emoticon"][emoticon]
      # binding.pry
      emoticons["get_emoticon"][emoticon]
      # binding.pry
    else
      return "Sorry, that emoticon was not found"
    end
  end

def get_english_meaning(file_path, emoticon)
  emoticons = load_library(file_path)
  if emoticons["get_meaning"][emoticon]
    # binding.pry
    emoticons["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

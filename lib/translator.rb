# require modules here
require "yaml"


def load_library(path)
  emoticons = YAML.load_file(path)

  newHash = {}

  newHash["get_meaning"] = {}
  newHash["get_emoticon"] = {}

  emoticons.each do |key, value|
    newHash["get_emoticon"][value[0]] = value[1]
    newHash["get_meaning"][value[1]] = key

  end
  puts newHash


  return newHash
end

def get_japanese_emoticon(path, west_emoji)
  # code goes here

  emoticons = load_library(path)
  if emoticons["get_emoticon"][west_emoji] == nil
    return "Sorry, that emoticon was not found"
  end

  return emoticons["get_emoticon"][west_emoji]

end

def get_english_meaning(path, jap_emoji)

  emoticons = load_library(path)
  if emoticons["get_meaning"][jap_emoji] == nil
    return "Sorry, that emoticon was not found"
  end
  return emoticons["get_meaning"][jap_emoji]

end


load_library("/home/luigipepe90-86455/code/labs/emoticon-translator-prework/lib/emoticons.yml")

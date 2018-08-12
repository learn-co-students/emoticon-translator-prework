require "yaml"

def load_library(path)
  emoticons = YAML.load_file(path)
  result = {
	  "get_meaning" => {},
	  "get_emoticon" => {}
	}
  emoticons.each do |key, emote|
  	result["get_meaning"][emote[1]] = key
  	result["get_emoticon"][emote[0]] = emote[1]
  end
  result
end

def get_japanese_emoticon(path, emoticon)
  emoticons = load_library(path)
  if emoticons["get_emoticon"][emoticon]
  	emoticons["get_emoticon"][emoticon]
  else
  	"Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticon)
  emoticons = load_library(path)
  if emoticons["get_meaning"][emoticon]
  	emoticons["get_meaning"][emoticon]
  else
  	"Sorry, that emoticon was not found"
  end
end
require 'yaml'
require 'pry'

def load_library(path)
  emotions = YAML.load_file(path)
  library = Hash.new {|hash,key| hash[key] = {}}
  emotions.each do |key, value|
  	library["get_emoticon"][value[0]] = value[1]
  	library["get_meaning"][value[1]] = key
  end
  library
end

def get_japanese_emoticon(path, emoticon)
	emoticon_hash = load_library(path)
	if emoticon_hash["get_emoticon"][emoticon] != nil
		emoticon_hash["get_emoticon"][emoticon]
	else
		"Sorry, that emoticon was not found"
	end	
end

def get_english_meaning(path, emoticon)
	emoticon_hash = load_library(path)
	if emoticon_hash["get_meaning"][emoticon] != nil
		emoticon_hash["get_meaning"][emoticon]
	else
		"Sorry, that emoticon was not found"
	end
end
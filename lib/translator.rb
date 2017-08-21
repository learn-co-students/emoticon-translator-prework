# require modules here
require "yaml"
require "pry"

def load_library(file_path)
  	translated_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  	emoticons = YAML.load_file(file_path)
  	emoticons.each do |meaning, emote_array|
  		translated_hash.each do |keys, hashes|
  			if keys == "get_emoticon"
  				hashes[emote_array[0]] = emote_array[1]
			end
		end
  		emote_array.each do |emote|
  			translated_hash.each do |key, hash|
  				if key == "get_meaning"
  					hash[emote] = meaning
				end
			end
		end
	end
	translated_hash
end

def get_japanese_emoticon(yaml_file_path, emote)
  	hash = load_library(yaml_file_path)
  	if hash["get_emoticon"][emote] == nil
  		"Sorry, that emoticon was not found"
  	else
  		hash["get_emoticon"][emote]
	end
end

def get_english_meaning(yaml_file_path, emote)
  	hash = load_library(yaml_file_path)
  	if hash["get_meaning"][emote] == nil
  		"Sorry, that emoticon was not found"
  	else
  		hash["get_meaning"][emote]
	end

end
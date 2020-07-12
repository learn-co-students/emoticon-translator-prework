# require modules here
require "yaml"

def load_library(file_path)
	#loaded file structure --- {eng_word: [eng_emoticon, jap_emoticon]}
	loaded_file = YAML.load_file(file_path)
	
	#desired structure --- {get_meaning: {jap_emoticon: eng_word}, get_emoticon: {eng_emoticon: jap_emoticon}}
	return_hash = {"get_meaning" => {}, "get_emoticon" => {}}
	loaded_file.each do |eng_word, emoticon_array|
		return_hash["get_meaning"][emoticon_array[1]] = eng_word
		return_hash["get_emoticon"][emoticon_array[0]] = emoticon_array[1]
	end
	return_hash
end

def get_japanese_emoticon(file_path, emoticon)
	file = load_library(file_path)
	japanese_emoticon = ""
	file.each do |key, value_hash|
		if key == "get_emoticon"
			if value_hash.keys.include?(emoticon) == false
				japanese_emoticon = "Sorry, that emoticon was not found"
			else
				value_hash.each do |eng_emoticon, jap_emoticon|
					if emoticon == eng_emoticon
						japanese_emoticon = jap_emoticon
					end
				end
			end
		end
	end
	japanese_emoticon
end

def get_english_meaning(file_path, emoticon)
	file = load_library(file_path)
	english_meaning = ""
	file.each do |key, value_hash|
		if key == "get_meaning"
			if value_hash.keys.include?(emoticon) == false
				english_meaning = "Sorry, that emoticon was not found"
			else
				value_hash.each do |jap_emoticon, eng_word|
					if emoticon == jap_emoticon
						english_meaning = eng_word
					end
				end
			end
		end
	end
	english_meaning
end

#get_japanese_emoticon('./emoticons.yml',":)")
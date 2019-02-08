require 'pry'
require "yaml"

def load_library(emoji)
 emoji = YAML.load_file('lib/emoticons.yml')
emoji_hash = Hash.new
#binding.pry
emoji_hash["get_emoticon"] = Hash.new
emoji_hash["get_meaning"] = Hash.new
#binding.pry

emoji.each do |word, emoji_list|
	#binding.pry
	
	emoji_hash["get_meaning"][emoji_list.last]  = word
	emoji_hash["get_emoticon"][emoji_list.first]  = emoji_list.last

#binding.pry
end
emoji_hash
#binding.pry
  # code goes here
end

def get_japanese_emoticon(emoji, english_emoticons)
	new_hash = load_library(emoji)
	#binding.pry

japanese_emoji = new_hash["get_emoticon"][english_emoticons]
if japanese_emoji == nil
	return "Sorry, that emoticon was not found"
else
#binding.pry
return japanese_emoji
#binding.pry
  # code goes here
end
end



def get_english_meaning(emoji, emoticon)



  new_hash = load_library(emoji)
english_emoji = new_hash["get_meaning"][emoticon]
if english_emoji == nil
return "Sorry, that emoticon was not found"
#"Sorry, that meaning was not found"
else
return english_emoji
end









# code goes here

end
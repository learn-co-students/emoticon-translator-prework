require "pry" 
require "yaml"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  final_hash = {}
  emoticons.each do |key, array|
    english_emoticon = emoticons[key][0]
    japanese_emoticon = emoticons[key][1]
    final_hash["get_emoticon"] = {english_emoticon => japanese_emoticon}
    final_hash["get_meaning"] = {japanese_emoticon => key}
# binding.pry 
  end 
# binding.pry
  final_hash
end




# {"get_emoticon" =>{the keys inside the 'get_emoticon' hash are the English emoticons}, "get_meaning" => {the keys inside the 'get_meaning' hash are the Japanese emoticons}}



def get_japanese_emoticon
  # code goes here
end

def get_english_meaning
  # code goes here
end



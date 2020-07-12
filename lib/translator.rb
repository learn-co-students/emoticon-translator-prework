require 'pry'
require 'yaml'

file_path = 'lib/emoticons.yml'

def load_library(file_path)
  library = { 'get_meaning' => {}, 'get_emoticon' => {} }
  YAML.load_file(file_path).each do |meaning, array|
    english_emote = array[0]
    jap_emote = array[1]
    library["get_meaning"][jap_emote] = meaning
    library["get_emoticon"][english_emote] = jap_emote
  end
  library
end

puts load_library(file_path)

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  if library['get_emoticon'][emoticon]
    library['get_emoticon'][emoticon]
  else
    return 'Sorry, that emoticon was not found'
  end
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  if library['get_meaning'][emoticon]
    library['get_meaning'][emoticon]
  else
    return 'Sorry, that emoticon was not found'
  end
end

{"get_meaning" => {"☜(⌒▽⌒)☞"=>"angel"}, "get_emoticon"=>{"O:)"=>"☜(⌒▽⌒)☞"}}
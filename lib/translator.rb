# require modules here
require 'yaml'
def load_library(file_path)
  new_hash = {'get_meaning' => {}, 'get_emoticon' => {}}
first_hash = YAML.load_file(file_path)
first_hash.each{|meaning, emoticons|
new_hash['get_meaning'][emoticons[1]] = meaning
new_hash['get_emoticon'][emoticons[0]] = emoticons[1]
}
new_hash
end

def get_japanese_emoticon(file_path, emoticon)
  translator = load_library(file_path)
  if translator['get_emoticon'][emoticon] != nil
    return translator['get_emoticon'][emoticon]
  end
"Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
translator = load_library(file_path)
if translator['get_meaning'][emoticon] != nil
  return translator['get_meaning'][emoticon]
end
"Sorry, that emoticon was not found"
end

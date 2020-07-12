# require modules here
require "yaml"
require 'pry'

file_path = '/Users/isaac/emoticon-translator-prework/lib/emoticons.yml'

def load_library (file_path)
  # code goes here

  dictionary = YAML.load_file(file_path)



     emoji_translator = {"get_meaning" => {}, "get_emoticon" => {}}

     dictionary.each do |words, emoji_array|

       emoji_translator["get_meaning"][emoji_array[-1]] = words
       emoji_translator["get_emoticon"][emoji_array[0]] = emoji_array[-1]

     end



emoji_translator

end




def get_japanese_emoticon(file_path, emoji)
  # code goes here
emoji_translator =  load_library (file_path)



  japanese_equivalent = emoji_translator["get_emoticon"][emoji]

  if japanese_equivalent == nil
    return "Sorry, that emoticon was not found"
  end
  japanese_equivalent

end

def get_english_meaning (file_path, emoji)
  # code goes here
emoji_translator =  load_library (file_path)


definition = emoji_translator["get_meaning"][emoji]

if definition == nil
  return "Sorry, that emoticon was not found"
end
definition
end

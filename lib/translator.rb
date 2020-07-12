require "yaml"
require "pry"

# YAML.load_file('lib/emoticons.yml')
def load_library(file_path)
  emoticons = YAML.load_file(file_path)

  result = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticons.each do |key, value|
    # binding.pry
result['get_meaning'][value[1]] = key
result['get_emoticon'][value[0]] = value[1]

end
result

end

def get_japanese_emoticon (file_path, passed_emoticon)
  emoticon_list = load_library(file_path)
  returned_emoticon = " "

  emoticon_list.each do |key, value|
    value.each do|emoticon, meaning|
      if emoticon.include?(passed_emoticon)
        returned_emoticon = meaning
      end
    end
  end
  if returned_emoticon == " "
    "Sorry, that emoticon was not found"
  else
returned_emoticon
end
end

def get_english_meaning (file_path, passed_emoticon)
  emoticon_list = load_library(file_path)
  returned_emoticon = " "
  emoticon_list.each do |key, value|
    value.each do|emoticon, meaning|
      if passed_emoticon.include?(emoticon)
        returned_emoticon = meaning
      end
    end
  end

  if returned_emoticon == " "
    "Sorry, that emoticon was not found"
  else

returned_emoticon
end 

end

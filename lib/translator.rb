# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  # code goes here
  updated_library = {}
  file_path = YAML.load_file('./lib/emoticons.yml')
    file_path.each do |meaning, array_of_emoticons|
      #get_meaning
      updated_library['get_meaning'] ||= {}
      updated_library['get_meaning'][array_of_emoticons[1]] = meaning
      #get_emoticon
      updated_library['get_emoticon'] ||= {}
      updated_library['get_emoticon'][array_of_emoticons[0]] = array_of_emoticons[1]
    end
    updated_library
end

def get_japanese_emoticon(file_path, emoticon)
  file_path = YAML.load_file('./lib/emoticons.yml')
  # code goes here
  library = load_library('./lib/emoticons.yml')
    library.each do |meaning_or_emoticon, inner_hash|
      if meaning_or_emoticon == "get_emoticon"
        inner_hash.each do |english, japanese|
          if inner_hash.keys.include?(emoticon)
            if emoticon == english
              return japanese
            end
          else
              return "Sorry, that emoticon was not found"
            end
        end
      end
    end
end

def get_english_meaning(file_path, emoticon)
  file_path = YAML.load_file('./lib/emoticons.yml')
  # code goes here
  library = load_library('./lib/emoticons.yml')
  library.each do |meaning_or_emoticon, inner_hash|
    if meaning_or_emoticon == "get_meaning"
      inner_hash.each do |japanese, meaning|
        if inner_hash.keys.include?(emoticon)
          if emoticon == japanese
            return meaning
          end
        else
            return "Sorry, that emoticon was not found"
          end
      end
    end
  end
end

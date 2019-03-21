# require modules here
require "yaml"
require "pry"

def load_library(file)
  # code goes here
  get_emoticon = {}
  get_meaning = {}
  translation_hash = {}
  translations = YAML.load_file(file)

    translations.each do |meaning, emoticons|
      emoticons.each do |emoticon|
        get_meaning[emoticons[1]] = meaning
        get_emoticon[emoticons[0]] = emoticons[1]
      end
    end
    translation_hash["get_emoticon"] = get_emoticon
    translation_hash["get_meaning"] = get_meaning
    translation_hash
    #binding.pry
end

def get_japanese_emoticon(file, emoticon)
  # code goes here
  japanese_emoticons = nil
  load_library(file).each do |gets_thing, thing|
    if gets_thing == "get_emoticon"
      thing.each do |english_emoticon, japanese_equivalent|
        if english_emoticon == emoticon
          return japanese_equivalent
        end
      end
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emoticon)
  # code goes here
  load_library(file).each do |gets_thing, thing|
    if gets_thing == "get_meaning"
      thing.each do |japanese_emoticon, meaning|
        if japanese_emoticon == emoticon
          return meaning
        end
      end
    end
  end
  return "Sorry, that emoticon was not found"
end

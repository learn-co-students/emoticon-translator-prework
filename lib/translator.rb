# require modules here
require 'yaml'

def load_library(file)
  # code goes here
  emoticons = YAML.load_file(file)
  empty_hash = {}
  english_array = []
  japanese_array = []
  meaning_array = []
  emoticons.each do |key, value_array|
    english_array.push(value_array[0])
    japanese_array.push(value_array[1])
    meaning_array.push(key)
  end
  japanese_array.each do |j_key|
    if empty_hash["get_meaning"] != nil
      empty_hash["get_meaning"][j_key] = meaning_array[japanese_array.index(j_key)]
    else
      empty_hash["get_meaning"] = {j_key => meaning_array[japanese_array.index(j_key)]}
    end
  end
  english_array.each do |e_key|
    if empty_hash["get_emoticon"] != nil
       empty_hash["get_emoticon"][e_key] = japanese_array[english_array.index(e_key)]
    else
      empty_hash["get_emoticon"] = {e_key => japanese_array[english_array.index(e_key)]}
    end
  end
  empty_hash
end

def get_japanese_emoticon(file, emoticon)
  # code goes here
  load_library(file)["get_emoticon"].each do |english, japanese|
    if english == emoticon
      return japanese
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emoticon)
  # code goes here
  load_library(file)["get_meaning"].each do |japanese, meaning|
    if japanese == emoticon
      return meaning
    end
  end
  return "Sorry, that emoticon was not found"
end

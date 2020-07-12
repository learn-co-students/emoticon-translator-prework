# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  new_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  thing = YAML.load_file(file_path)
  thing.each do |english_meaning, emoticon_arr|
      new_hash["get_meaning"][emoticon_arr[1]] = english_meaning
      new_hash["get_emoticon"][emoticon_arr[0]] = emoticon_arr[1]
  end
  return new_hash
end

def get_japanese_emoticon(file_path, eng_emoticon)
  new_hash = load_library(file_path)
  if new_hash["get_emoticon"].keys.include?(eng_emoticon) == false
      return "Sorry, that emoticon was not found"
  elsif new_hash["get_emoticon"].keys.include?(eng_emoticon) == true
      new_hash["get_emoticon"].each do |eng_emo, j_emo|
        if eng_emoticon == eng_emo
          return j_emo
        end
      end
  end
end

def get_english_meaning(file_path, j_emoticon)
   new_hash = load_library(file_path)
    if new_hash["get_meaning"].keys.include?(j_emoticon) == false
        return "Sorry, that emoticon was not found"
    elsif new_hash["get_meaning"].keys.include?(j_emoticon) == true
        new_hash["get_meaning"].each do |j_emo, meaning|
          if j_emoticon == j_emo
            return meaning
          end
        end
    end
end

get_english_meaning('./lib/emoticons.yml', "☜(⌒▽⌒)☞")

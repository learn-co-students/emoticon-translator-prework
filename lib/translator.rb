# require modules here
require "yaml"

#hash = {"meaning_1" => ["e_emoticon1", "j_emoticon1"], "meaning_2" => ["e_emoticon2", "j_emoticon2"]}


def load_library(yaml_file)
  emoticons = YAML.load_file('./lib/emoticons.yml')
  j_emoticons = emoticons.collect { |meanings, emoticons| emoticons[1] }
  e_emoticons = emoticons.collect { |meanings, emoticons| emoticons[0] }
  meanings = emoticons.collect { |meanings, emoticons| meanings }
  #use these variables to insert the keys inside (check on this/pick up here)
  #emoticons_hash = {"get_meaning" => {j_emoticons => []}, "get_emoticon" => {e_emoticons => []}}
  english_dictionary = {}
  j = 0
  while j < e_emoticons.length do
    english_dictionary[e_emoticons[j]] = j_emoticons[j]
    j += 1
  end
  japanese_dictionary = {}
  i = 0
  while i < j_emoticons.length do
    japanese_dictionary[j_emoticons[i]] = meanings[i]
    i += 1
  end

  emoticons_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticons_hash["get_meaning"] = japanese_dictionary
  emoticons_hash["get_emoticon"] = english_dictionary
  emoticons_hash
end


def get_japanese_emoticon(yaml_file, emoticon)
  result = nil
  emoticons_hash = load_library('./lib/emoticons.yml')
  emoticons_hash.each do |get, translations|
    translations.each do |emoticons, translated|
      if emoticon == emoticons
        result = translated
      end
    end
  end
  result.nil? ? "Sorry, that emoticon was not found" : result
end

def get_english_meaning(yaml_file, emoticon)
  result = nil
  emoticons_hash = load_library('./lib/emoticons.yml')
  emoticons_hash.each do |get, translations|
    translations.each do |emoticons, translated|
      if emoticon == emoticons
          result = translated
      end
    end
  end
  result.nil? ? "Sorry, that emoticon was not found" : result
end

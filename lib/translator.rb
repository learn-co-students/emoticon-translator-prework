require "yaml"

require 'pry'

def load_library(file)

  library = YAML.load_file(file)
  translation_hash = {"get_emoticon" => {}, "get_meaning" => {}}

    library.each { |english, emoticons|
      translation_hash["get_emoticon"][emoticons[0]] = emoticons[1]
      translation_hash["get_meaning"][emoticons[1]] = english

}
    translation_hash
end

def get_japanese_emoticon(file, emoticon)
  hash = load_library(file)

  english_emoticons = hash["get_emoticon"].keys
  if english_emoticons.include?(emoticon)
    return hash["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
    # get_meaning.each { |japanese2, english_word|
    #     if japanese_emoticon == japane
  end

end

def get_english_meaning(file, emoticon)
  hash = load_library(file)

  japanese_emoticons = hash["get_meaning"].keys
  if japanese_emoticons.include?(emoticon)
    return hash["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

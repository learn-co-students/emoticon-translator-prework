# require modules here
require "yaml"
require 'pry'

def load_library(path)
  # code goes here
  emoticons = YAML.load_file(path)
  emoticons_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticons.each do |definition, emoticon|
      emoticons_hash["get_emoticon"][emoticon.first] = emoticon.last
      #binding.pry
      end
   emoticons.each do |definition, emoticon|
  emoticons_hash["get_meaning"][emoticon.last] = definition
  end
   emoticons_hash
   #binding.pry
end

def get_japanese_emoticon (path, emoticons)
  # code goes here
  sorry_message = "Sorry, that emoticon was not found"
  emoticons_hash = load_library(path)
  emoticons_hash["get_emoticon"].each do |keys, values|
          #japanese_emoji
          return values if emoticons == keys
#          return japanese_emoji if japanese_emoji == emoticons
#binding.pry
#          else
#            return sorry_message
#          binding.pry
#end
      end
  sorry_message
end

def get_english_meaning (path, emoticons)
  # code goes here
  sorry_message = "Sorry, that emoticon was not found"
  emoticons_hash = load_library(path)
  emoticons_hash["get_meaning"].each do |keys, values|
      return values if keys == emoticons
      #binding.pry
      end
  sorry_message
end

# require modules here
require "pry"
require 'yaml'

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  restructured_emot = {}
  holder_array1 = []
  holder_array2 = []
  emoticons.each do |english, emotico|
    holder_array1 << {emotico[0] => emotico[1]}
    holder_array2 << {emotico[1] => english}
  end
  restructured_emot["get_meaning"] = holder_array2.reduce Hash.new, :merge
  restructured_emot["get_emoticon"] = holder_array1.reduce Hash.new, :merge
  restructured_emot
end

def get_japanese_emoticon(file_path, emoticon)
  load_lib = load_library(file_path)
  if load_lib["get_emoticon"].key?(emoticon)
    load_lib["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"    
  end 
end

def get_english_meaning(file_path, emoticon)
  load_lib = load_library(file_path)
  if load_lib["get_meaning"].key?(emoticon)
    load_lib["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"    
  end
end
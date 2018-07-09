# require modules here
require "yaml"
require 'pry'

def load_library(file_path)
  library = YAML.load_file(file_path)
  new_lib = { "get_meaning" => {}, "get_emoticon" => {}}

  library.keys.each do |lib_key|
    new_lib["get_meaning"][library[lib_key][1]] = lib_key
    new_lib["get_emoticon"][library[lib_key][0]] = library[lib_key][1]
  end

  new_lib
end

def get_japanese_emoticon(file_path, emoticon)
  get_answer(file_path, emoticon, "get_emoticon")
end

def get_english_meaning(file_path, emoticon)
  get_answer(file_path, emoticon, "get_meaning")
end

def get_answer(file_path, emoticon, key)
  library = load_library(file_path)
  library[key][emoticon] ? library[key][emoticon] : "Sorry, that emoticon was not found"
end

require "yaml"

def load_library(file_path)
  library = YAML.load_file(file_path)
  sorted_library = {"get_meaning" => {}, "get_emoticon" => {}}
  library.each do |meaning, emoticon_array|
    english_emoticon = emoticon_array[0]
    japanese_emoticon = emoticon_array[1]
    sorted_library["get_meaning"][japanese_emoticon] = meaning
    sorted_library["get_emoticon"][english_emoticon] = japanese_emoticon
  end
  sorted_library
end

def get_japanese_emoticon(file_path, english_emoticon)
  emoticon_dictionary = load_library(file_path)
  if emoticon_dictionary["get_emoticon"].keys.include?(english_emoticon)
    emoticon_dictionary["get_emoticon"].values_at(english_emoticon).join
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, japansese_emoticon)
  emoticon_dictionary = load_library(file_path)
  if emoticon_dictionary["get_meaning"].keys.include?(japansese_emoticon)
    emoticon_dictionary["get_meaning"].values_at(japansese_emoticon).join
  else
    "Sorry, that emoticon was not found"
  end
end

# require modules here
require "yaml"


def load_library(file_path)
  library = YAML.load_file(file_path)
  output = {"get_meaning" => {}, "get_emoticon" => {}}
  library.each do | meaning, emo_array|
    output["get_meaning"].merge!(emo_array[1] => meaning)
    output["get_emoticon"].merge!(emo_array[0] => emo_array[1])
  end
  output
end

def get_japanese_emoticon(file_path, emoticon)
  sorted_library = load_library(file_path)
  if sorted_library["get_emoticon"].keys.include?(emoticon)
    japanese_emoticon = sorted_library["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  sorted_library = load_library(file_path)
  if sorted_library["get_meaning"].keys.include?(emoticon)
    english_meaning = sorted_library["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

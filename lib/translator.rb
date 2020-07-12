# require modules here
require "yaml"


def load_library(file_path)
  result = {"get_meaning" => {}, "get_emoticon" => {}}
  data = YAML.load_file(file_path)
  data.each do |description, array|
    english, japanese = array
    result["get_emoticon"][english] = japanese
    result["get_meaning"][japanese] = description
  end
  result
end

def get_japanese_emoticon(file_path, emoticon)
  data = load_library(file_path)
  japanese_emoticon = data["get_emoticon"][emoticon]
  if japanese_emoticon
    return japanese_emoticon
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, japanese_emoticon)
  data = load_library(file_path)
  meaning = data["get_meaning"][japanese_emoticon]
  if meaning
    return meaning
  else
    "Sorry, that emoticon was not found"
  end
end

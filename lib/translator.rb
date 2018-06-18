require "yaml"

def load_library(path_to_file)
  container = YAML.load_file(path_to_file)
  result = {"get_meaning" => {}, "get_emoticon" => {}}

  container.each do |name, emoticons|
    result["get_meaning"][emoticons[1]] = name
    result["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  result
end

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  if library["get_emoticon"][emoticon]
    library["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  if library["get_meaning"][emoticon]
    library["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end
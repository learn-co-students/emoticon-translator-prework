require "yaml"

def load_library(file_path)
  result =
  {
    "get_meaning" => {},
    "get_emoticon" => {}
  }

  library = YAML.load_file(file_path)

  library.each do |name, emoticon|
    result["get_meaning"][emoticon[1]] = name
    result["get_emoticon"][emoticon[0]] = emoticon[1]
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

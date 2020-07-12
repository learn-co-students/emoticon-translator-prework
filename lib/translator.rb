require "yaml"

def load_library(path)
  library = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }

  YAML.load_file(path).each do |meaning, emoticons|
    eng, jap = emoticons
    library["get_emoticon"][eng] = jap
    library["get_meaning"][jap] = meaning
  end
  library
end

def get_japanese_emoticon(path, emoticons)
  library = load_library(path)

  if library["get_emoticon"][emoticons]
    library["get_emoticon"][emoticons]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticons)
  library = load_library(path)

  if library["get_meaning"][emoticons]
    library["get_meaning"][emoticons]
  else
    return "Sorry, that emoticon was not found"
  end
end

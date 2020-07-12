require "yaml"

def load_library(path)
  emoticons = YAML.load_file(path)
  result = {
    'get_meaning' => {},
    'get_emoticon' => {}
  }

  emoticons.each do |meaning, texts|
    english = texts[0]
    japanese = texts[1]
    result['get_meaning'][japanese] = meaning
    result['get_emoticon'][english] = japanese
  end
  result
end

def get_japanese_emoticon(path, emoticon)
  library = load_library(path)

  if library['get_emoticon'].has_key?(emoticon)
    return library['get_emoticon'][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end

end

def get_english_meaning(path, emoticon)
  library = load_library(path)

  if library['get_meaning'].has_key?(emoticon)
    return library['get_meaning'][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end

end

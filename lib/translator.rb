require "yaml"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  library = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticons.each do |emotion, symbol|
    if library["get_meaning"][symbol[1]] == nil
      library["get_meaning"][symbol[1]] = emotion
    end
    if library["get_emoticon"][symbol[0]] == nil
      library["get_emoticon"][symbol[0]] = symbol[1]
    end
  end
  library
end

def get_japanese_emoticon(file_path, emoticon)
  return_value = ""
  library = load_library(file_path)
  if library["get_emoticon"].keys.include?(emoticon)
    library.each do |method, info|
      info.each do |english, japanese|
        if emoticon == english
          return_value << japanese
        end
      end
    end
  else
    return_value << "Sorry, that emoticon was not found"
  end
  return_value
end

def get_english_meaning(file_path, emoticon)
  return_value = ""
  library = load_library(file_path)
  if library["get_meaning"].keys.include?(emoticon)
    library.each do |method, info|
      info.each do |japanese, meaning|
        if emoticon == japanese
          return_value << meaning
        end
      end
    end
  else
    return_value << "Sorry, that emoticon was not found"
  end
  return_value
end

require "yaml"

def load_library(file_path)
  library = YAML.load_file(file_path)
  new_library = {"get_meaning" => {}, "get_emoticon" => {}}
  library.each do |meaning, emoticons|
    new_library["get_meaning"][emoticons[1]] = meaning
    new_library["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  new_library
end

def get_japanese_emoticon(file_path, emoticon)
  new_library = load_library(file_path)
  japanese_emoticon = ""
  if new_library["get_emoticon"].keys.include?(emoticon)
    new_library.each do |key, value|
      value.each do |english, japanese|
        if english == emoticon
          japanese_emoticon = japanese
        end
      end
    end
  else
    japanese_emoticon = "Sorry, that emoticon was not found"
  end
  japanese_emoticon
end

def get_english_meaning(file_path, emoticon)
  new_library = load_library(file_path)
  emoticon_meaning = ""
  if new_library["get_meaning"].keys.include?(emoticon)
    new_library.each do |key, value|
      value.each do |japanese_emoticon, meaning|
        if japanese_emoticon == emoticon
          emoticon_meaning = meaning
        end
      end
    end
  else
    emoticon_meaning = "Sorry, that emoticon was not found"
  end
  emoticon_meaning
end

require "pry"
require "yaml"

def load_library(file)
  emoticons = YAML.load_file(file)
  library_hash = { "get_meaning" => {}, "get_emoticon" => {} }
  emoticons.each do |meaning, array|
    english = array[0]
    japanese = array[1]
    library_hash["get_meaning"][japanese] = meaning
    library_hash["get_emoticon"][english] = japanese
  end
  library_hash
end

def get_japanese_emoticon(file, emoticon)
  data = load_library(file)
  data.each do |key, hash|
    if key == "get_emoticon"
      if data["get_emoticon"].keys.include?(emoticon)
        hash.each do |eng, jap|
          if eng == emoticon
            return jap
          end
        end
      else
        return "Sorry, that emoticon was not found"
      end
    end
  end
end

def get_english_meaning(file, emoticon)
  data = load_library(file)
  data.each do |key, hash|
    if key == "get_meaning"
      if data["get_meaning"].keys.include?(emoticon)
        hash.each do |jap, meaning|
          if jap == emoticon
            return meaning
          end
        end
      else
        return "Sorry, that emoticon was not found"
      end
    end
  end
end
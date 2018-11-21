require "yaml"


def load_library(filePath)
  emot_hash = YAML.load_file(filePath)
  newHash = {"get_meaning" => {}, "get_emoticon" => {}}
  emot_hash.each do |meaning, emot|
    newHash["get_meaning"][emot[1]] = meaning
    newHash["get_emoticon"][emot[0]] = emot[1]  
  #angel: meaning
  #- "O:)"      english 
  #- "☜(⌒▽⌒)☞"  japanese
  end
  newHash
end

def get_japanese_emoticon(filePath, emoticon)
  library = load_library(filePath)
  library["get_emoticon"].each do |eng, jap|
    if eng == emoticon
      return jap
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(filePath, emoticon)
  library = load_library(filePath)
  library["get_meaning"].each do |jap, meaning|
    if jap == emoticon
      return meaning
    end
  end
  return "Sorry, that emoticon was not found"
end
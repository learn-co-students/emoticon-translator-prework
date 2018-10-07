# require modules here
require "yaml"
#emoticons = YAML.load_file('lib/emoticons.yml')

def load_library(file_path)
  emo_hash = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  emoticons = YAML.load_file(file_path)
  emoticons.each { |meaning, emo_arr|
    emo_hash["get_meaning"][emo_arr[1]]= meaning
    emo_hash["get_emoticon"][emo_arr[0]]= emo_arr[1]
  }
  emo_hash
end

def get_japanese_emoticon(file_path, emoticon)
  emo_hash = load_library(file_path)
  emo_hash["get_emoticon"].each { |eng, japn|
      if eng == emoticon
        return japn
      end
  }
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  emo_hash = load_library(file_path)
  emo_hash["get_meaning"].each { |jpn_emo, meaning|
    if jpn_emo == emoticon
      return meaning
    end
  }
  return "Sorry, that emoticon was not found"
end

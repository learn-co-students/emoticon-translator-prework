require "yaml"


def load_library(emoticon_file)
  # code goes here
  emoticons = YAML.load_file('./lib/emoticons.yml')

  emoticon_hash = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }

  emoticons.each do |meaning, emotions|
    english = emotions[0]
    japanese = emotions[1]

    emoticon_hash["get_meaning"][japanese] = meaning
    emoticon_hash["get_emoticon"][english] = japanese
  end

emoticon_hash

end

def get_japanese_emoticon(emoticon_file, emoticon)
  # code goes here
    emoticon_hash = load_library(emoticon_file)

    japanese_emoticon = emoticon_hash["get_emoticon"][emoticon]

    if japanese_emoticon == nil
      return "Sorry, that emoticon was not found"
    end

    japanese_emoticon

end

def get_english_meaning(emoticon_file, emoticon)

  emoticon_hash = load_library(emoticon_file)

  english_meaning = emoticon_hash["get_meaning"][emoticon]

  if english_meaning == nil
    return "Sorry, that emoticon was not found"
  end

  english_meaning

end
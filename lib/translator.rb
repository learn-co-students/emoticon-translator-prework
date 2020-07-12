require "yaml"

emoticons = "./lib/emoticons.yml"

def load_library(emoticons)

  library_hash = {
    "get_meaning" => {},
    "get_emoticon" => {}
   }



    YAML.load_file(emoticons).each do |meaning, translation|

    english = translation[0]
    japanese = translation[1]

    library_hash["get_meaning"][japanese] = meaning
    library_hash["get_emoticon"][english] = japanese

  end

  library_hash
end

def get_japanese_emoticon(emoticons, emoji)

  library = load_library(emoticons)
   key = library["get_emoticon"][emoji]

    if key
      key
    else
      "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(emoticons, emoji)
  library = load_library(emoticons)
   key = library["get_meaning"][emoji]

   if key
     key
   else
     "Sorry, that emoticon was not found"
 end
end

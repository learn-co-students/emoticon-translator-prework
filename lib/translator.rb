 require 'yaml'
 require 'pry'

the_path = "/Users/andrewrivera/development/ruby/advanced_hashes/emoticon-translator-prework/lib/emoticons.yml"

def load_library(the_path)
  emoticons = YAML.load_file(the_path)

  return_hash = {
    'get_meaning' => {},
    'get_emoticon' => {}
  }

  emoticons.each do |meaning, emoticons|
    return_hash['get_meaning'][emoticons[1]] = meaning
    return_hash['get_emoticon'][emoticons[0]] = emoticons[1]
  end
  return_hash
end

def get_japanese_emoticon(the_path, emoticon)
  return_hash = load_library(the_path)

  return_hash.each do |get, hash|
    if get == "get_emoticon"
      hash.each do |usa, japan|
        if usa == emoticon
          return japan
        end
      end
      return "Sorry, that emoticon was not found"
    end
  end
end

def get_english_meaning(the_path, emoticon)
  return_hash = load_library(the_path)

  return_hash.each do |get, hash|
    if get == "get_meaning"
      hash.each do |emote, english|
        if emote == emoticon
          return english
        end
      end
    return "Sorry, that emoticon was not found"
    end
  end
end

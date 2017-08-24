
require 'yaml'

def load_library
  YAML.load_file('emoticons.yml')
end

def get_japanese_emoticon(emoticon)
  load_library.each do |trans, emot|
    if emot[0]==emoticon
      return emot[1]
    end
  end

end

def get_english_meaning(emoticon)
  j=get_japanese_emoticon(emoticon)
  load_library.each do |trans, emot|
    if emot[1]==j
      return trans
    end
  end

end

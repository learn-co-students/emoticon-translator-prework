require 'yaml'

def load_library(path)
  icons = YAML.load_file(path)
  newHash = {'get_meaning' => {}, 'get_emoticon' => {}}
  icons.each do |trans, emot|
    newHash['get_meaning'][emot[1]] = trans
    newHash['get_emoticon'][emot[0]] = emot[1]
  end
  newHash
end

def get_japanese_emoticon(file_path, emoticon)
  load_library(file_path)['get_emoticon'].each do |eng, jas|
    if eng == emoticon
      return jas
    end
  end
  return 'Sorry, that emoticon was not found'
end

def get_english_meaning(file_path, emot)
  load_library(file_path)['get_meaning'].each do |pic,trans|
    if emot ==  pic
      return trans
    end
  end
  return 'Sorry, that emoticon was not found'
end

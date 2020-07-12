require 'yaml'

def load_library(filepath)
  emoticons = YAML.load_file(filepath)
  translate = { "get_meaning" => {}, "get_emoticon" => {}}
    emoticons.each do |meaning, emoticon|
      translate["get_meaning"][emoticon[1]] = meaning
      translate["get_emoticon"][emoticon[0]] = emoticon[1]
    end
    translate
  end


def get_japanese_emoticon(file, emoticon)
  translate = load_library(file)
    if translate["get_emoticon"].has_key?(emoticon)
      jap_emoticon = translate["get_emoticon"][emoticon]
    else
    jap_emoticon = "Sorry, that emoticon was not found"
    end
  jap_emoticon
end

def get_english_meaning(file, emoticon)

 translate = load_library(file)
 if translate["get_meaning"].has_key?(emoticon)
    eng_emoticon = translate["get_meaning"][emoticon]
 else
    eng_emoticon = "Sorry, that emoticon was not found"
  end
  eng_emoticon
end

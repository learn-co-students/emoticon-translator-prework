require 'yaml'

def load_library(file)
    file = YAML.load_file("/Users/Huang/Documents/LearnDevelopment/code/emoticon-translator-prework/lib/emoticons.yml")
    
    translator = {
        "get_meaning" => {},
        "get_emoticon" => {}
    }
    
    file.each do |emotion, emot_array|
        eng = emot_array[0]
        jap = emot_array[1]
        translator["get_meaning"][jap] = emotion
        translator["get_emoticon"][eng] = jap
    end
    
    translator
end

def get_japanese_emoticon(file, emoticon)
    translator = load_library("./lib/emoticons.yml")
    
    if translator["get_emoticon"][emoticon] == nil
        "Sorry, that emoticon was not found"
    else
        translator["get_emoticon"][emoticon]
    end
end

def get_english_meaning(file, emoticon)
    translator = load_library("./lib/emoticons.yml")
    
    if translator["get_meaning"][emoticon] == nil
        "Sorry, that emoticon was not found"
    else
        translator["get_meaning"][emoticon]
    end
end
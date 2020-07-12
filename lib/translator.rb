
require 'pry'
require 'yaml'

def load_library(path)
    emoticon_hash = YAML.load_file(path)
    final_hash = {}
    final_hash["get_meaning"] = []
    final_hash["get_emoticon"] = []
    new_final = {}
    emoticon_hash.each do |meaning, emoticon_array|
        final_hash["get_meaning"] << {emoticon_array[1] => meaning}
        final_hash["get_emoticon"] << {emoticon_array[0] => emoticon_array[1]}
    end
    
    new_array = final_hash.collect do |k, v|
        v.reduce Hash.new, :merge
    end
    
    new_final["get_meaning"] =  new_array[0]
    new_final["get_emoticon"] = new_array[1]
    new_final
    
end

load_library("./lib/emoticons.yml")

def get_japanese_emoticon(path, emoticon)
    emoticon_hash = load_library(path)
    emoticon_hash.each do |k, v|
        if k == "get_emoticon"
            v.each do |english_emoticon, japanese_emoticon|
                unless v.include?(emoticon)
                    return "Sorry, that emoticon was not found"
                end
                if emoticon == english_emoticon
                    return japanese_emoticon
                end
            end
        end
    end
end

get_japanese_emoticon("./lib/emoticons.yml", ":)")

def get_english_meaning(path, emoticon)
    emoticon_hash = load_library(path)
    emoticon_hash.each do |k, v|
        if k == "get_meaning"
            v.each do |japanese_emoticon, translation|
                unless v.include?(emoticon)
                    return "Sorry, that emoticon was not found"
                end
                if emoticon == japanese_emoticon
                    return translation
                end
            end
        end
    end
end


get_english_meaning("./lib/emoticons.yml", "(＾ｖ＾)")




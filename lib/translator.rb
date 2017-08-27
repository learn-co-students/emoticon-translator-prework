require 'yaml'

def load_library(file_path)

emotes = YAML.load_file(file_path)

    xyz = {"get_emoticon" => {}, "get_meaning" => {}}

        emotes.each do |k,v|

            xyz["get_meaning"][v[1]] = k
            xyz["get_emoticon"][v[0]] = v[1]

        end
    xyz
end

def get_japanese_emoticon(file_path, emoticon)

    xyz = load_library(file_path)

    if xyz["get_emoticon"][emoticon]

        xyz["get_emoticon"][emoticon]

    else

        "Sorry, that emoticon was not found"

    end
end

def get_english_meaning(file_path, emoticon)

    xyz = load_library(file_path)

    if xyz["get_meaning"][emoticon]

        xyz["get_meaning"][emoticon]

    else

        "Sorry, that emoticon was not found"

    end
end

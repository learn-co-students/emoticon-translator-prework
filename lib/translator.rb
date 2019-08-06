# require modules here
require "yaml"
require 'pry'

def load_library(path)
  # code goes here
  table = YAML.load_file(path)
  library = {
    'get_meaning' => { 
      # ☜(⌒▽⌒)☞ => table key
      }, 
    'get_emoticon' => { 
      # O:) => ☜(⌒▽⌒)☞
      }
  }
  table.each do |meaning, arr|   
    # arr[0] is english emoj, arr[1] is japan emoj
    library['get_meaning'][arr[1]] = meaning
    library['get_emoticon'][arr[0]] = arr[1]
  end
  library
end

# {"angel"=>["O:)", "☜(⌒▽⌒)☞"],
# "angry"=>[">:(", "ヽ(ｏ`皿′ｏ)ﾉ"],
# "bored"=>[":O", "(ΘεΘ;)"],
# "confused"=>["%)", "(゜.゜)"],
# "embarrased"=>[":$", "(#^.^#)"],
# "fish"=>["><>", ">゜))))彡"],
# "glasses"=>["8D", "(^0_0^)"],
# "grinning"=>["=D", "(￣ー￣)"],
# "happy"=>[":)", "(＾ｖ＾)"],
# "kiss"=>[":*", "(*^3^)/~☆"],
# "sad"=>[":'(", "(Ｔ▽Ｔ)"],
# "surprised"=>[":o", "o_O"],
# "wink"=>[";)", "(^_-)"]
# }

# library = {
#   'get_meaning' => { 
#     # ☜(⌒▽⌒)☞ => angel
#     }, 
#   'get_emoticon' => { 
#     # O:) => ☜(⌒▽⌒)☞
#     }
# }

def get_japanese_emoticon(path, emoticon)
  # code goes here
  library = load_library(path)
  japan_equi = library['get_emoticon'][emoticon]
  if japan_equi.nil? 
    return "Sorry, that emoticon was not found"
  else 
    return japan_equi
  end
end

def get_english_meaning(path, emoticon)
  # code goes here
  library = load_library(path)
  english_meaning = library['get_meaning'][emoticon]
  if english_meaning.nil? 
    return "Sorry, that emoticon was not found"
  else 
    return english_meaning
  end
end


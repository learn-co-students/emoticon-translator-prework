require 'yaml'
require 'pry'

#    #library_hash =  {"get_meaning"=>{"☜(⌒▽⌒)☞"=>"angel"}, "get_emoticon"=>{"O:)"=>"☜(⌒▽⌒)☞"}}
    # jap_emoticons = 'get_meaning'[emoticons[0]]" || 'get_emoticons[emoticons[1]] ==>'☜(⌒▽⌒)☞"
    #eng emoticon = 'get_emoticons'[emoticons[0]] ==> 'O:)'
    #meaning = 'get_meaning'[emoticons[1]]  ==>  "angel"

def load_library(file_path)
  path = YAML.load_file(file_path)
  library_hash = { "get_meaning" => {}, "get_emoticon" => {} }
  path.each do |meaning, emoticons|
    library_hash["get_meaning"][emoticons[1]] = meaning   #☜(⌒▽⌒)☞" = 'angel'
    library_hash["get_emoticon"][emoticons[0]] = emoticons[1]   #"O:)" = "☜(⌒▽⌒)☞"
  end
  library_hash
end


def get_japanese_emoticon(file_path, emoticon)
  path = YAML.load_file(file_path)
  library_hash = load_library(file_path)
  compare_h = library_hash['get_emoticon']
  #if eng emoticon param = w/in ({get_emoticon"=>{"O:)"=>"☜(⌒▽⌒)☞"}})
  compare_h.include?(emoticon) ? compare_h[emoticon] : "Sorry, that emoticon was not found"
end


def get_english_meaning(file_path, emoticon)
  path = YAML.load_file(file_path)
  library_hash = load_library(file_path)
  define_h = library_hash['get_meaning']
      # if jap emoticon param = w/in ({"get_meaning"=>{"☜(⌒▽⌒)☞"=>"angel"}})
  define_h.include?(emoticon) ? define_h[emoticon] : "Sorry, that emoticon was not found"
end

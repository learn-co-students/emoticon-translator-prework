require 'yaml'

def load_library(file_path)
  library = YAML.load_file(file_path)
  return_hash = {}
  get_meaning = {}
  get_emoticon = {}

  library.each do |key, emoticons_array|
    get_emoticon[emoticons_array[0]] = emoticons_array[1]
    get_meaning[emoticons_array[1]] = key
  end

  return_hash["get_meaning"] = get_meaning
  return_hash["get_emoticon"] = get_emoticon
  return_hash
end

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  library["get_emoticon"][emoticon].nil? ? "Sorry, that emoticon was not found" : library["get_emoticon"][emoticon]
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  library["get_meaning"][emoticon].nil? ? "Sorry, that emoticon was not found" : library["get_meaning"][emoticon]
end

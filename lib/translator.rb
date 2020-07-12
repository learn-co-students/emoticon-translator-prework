# require modules here

require "yaml"

def load_library(yaml_file)
  # code goes here
 yaml_data = YAML.load_file(yaml_file)
 emoticons = yaml_data.values
 meanings = yaml_data.keys
 data = {}
 data["get_emoticon"] = {}
 data["get_meaning"] = {}

 emoticons.each do |emoticon_element|
 meanings.each do |meaning|
 yaml_data.each do |key, value|
  if key == meaning && value[1] == emoticon_element[1]
   data["get_meaning"][emoticon_element[1]] = meaning
  end
  end
 end
 end

 emoticons.each do |emoticon_element|
 meanings.each do |meaning|
 yaml_data.each do |key, value|
  if key == meaning && value[0] == emoticon_element[0]
    data["get_emoticon"][emoticon_element[0]] = emoticon_element[1]
  end
 end
 end
 end
return data
end

def get_japanese_emoticon(yaml_file, emoticon)
  # code goes here
  data = load_library(yaml_file)
  if !data["get_emoticon"][emoticon]
    return "Sorry, that emoticon was not found"
  end
  return data["get_emoticon"][emoticon]
end

def get_english_meaning(yaml_file, emoticon)
  # code goes here
  data = load_library(yaml_file)
  if !data["get_meaning"][emoticon]
    return "Sorry, that emoticon was not found"
  end
  return data["get_meaning"][emoticon]
end

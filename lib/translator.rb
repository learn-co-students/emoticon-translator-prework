require "yaml"

def load_library(file_path)
  raw_hash = YAML.load_file(file_path)
  results = {}
  results["get_meaning"] = {}
  results["get_emoticon"] = {}
  raw_hash.each do |meaning,icons|
    results["get_meaning"][icons[1]] = meaning
    results["get_emoticon"][icons[0]] = icons[1]
  end
  results
end

def get_japanese_emoticon(file_path,emoticon)
  emoticons_hash = load_library(file_path)
  emoticons_hash["get_emoticon"][emoticon] || "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path,emoticon)
  emoticons_hash = load_library(file_path)
  emoticons_hash["get_meaning"][emoticon] || "Sorry, that emoticon was not found"
end

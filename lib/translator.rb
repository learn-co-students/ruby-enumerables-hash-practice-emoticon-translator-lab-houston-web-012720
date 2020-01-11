require "yaml"

def load_library (path)
  dictionary = YAML.load_file(path)
  lookup = {
  :get_meaning => {},
  #keys inside get_meaning are japanese emoticons that point to their meanings
  :get_emoticon => {}
  #keys inside :get_emoticon are english emoticons pointing to their japenese equivalents
  }
  dictionary.each do |meaning, emoticons|
    lookup[:get_meaning][emoticons[1]] = meaning
    lookup[:get_emoticon][emoticons[0]] = emoticons[1]
  end
  lookup
end

def get_japanese_emoticon(path, english_emoticon)
  lookup = load_library(path)
  japanese_emoticon = lookup[:get_emoticon][english_emoticon]
  if japanese_emoticon
    japanese_emoticon
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, japanese_emoticon)
  lookup = load_library(path)
  english_emoticon = lookup[:get_meaning][japanese_emoticon]
  if english_emoticon
    english_emoticon
  else
    "Sorry, that emoticon was not found"
  end
end
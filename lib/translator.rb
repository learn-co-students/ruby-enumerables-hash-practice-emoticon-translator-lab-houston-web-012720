# require modules here
require "yaml"

def test
  # './lib/emoticons.yml'
  pp load_library("./lib/emoticons.yml")
  #puts get_japanese_emoticon("O:)")
  #puts get_english_meaning("☜(⌒▽⌒)☞")
end

def load_library(filepath)
  # code goes here
  raw_data = YAML.load_file(filepath)
  structured_library = {
    'get_meaning' => {},
    'get_emoticon' => {}
  }
  raw_data.each { |meaning, value|
    structured_library['get_emoticon'][value[0]] = value[1]
    structured_library['get_meaning'][value[1]] = meaning
  }
  structured_library
  
end

def get_japanese_emoticon(filepath, eng_emoticon)
  # code goes here
  library = load_library(filepath)
  jap_emoticon = library['get_emoticon'][eng_emoticon]
  if !jap_emoticon
    jap_emoticon = "Sorry, that emoticon was not found"
  end
  jap_emoticon
end

def get_english_meaning(filepath, jap_emoticon)
  # code goes here
  library = load_library(filepath)
  meaning = library['get_meaning'][jap_emoticon]
  if !meaning
    meaning = "Sorry, that emoticon was not found"
  end
  meaning
  
end
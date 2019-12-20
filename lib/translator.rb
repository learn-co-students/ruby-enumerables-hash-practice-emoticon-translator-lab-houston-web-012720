# require modules here
require "yaml"
require 'pry'
def load_library(file_path)
  # code goes here
 
  emoticons = YAML.load_file(file_path)
  
  new_emoticons = {'get_meaning': {}, 'get_emoticon': {}}
  emoticons.each do |meaning, emoticon|
    
    new_emoticons[:get_meaning][emoticon[1]] = meaning 
    new_emoticons[:get_emoticon][emoticon[0]] = emoticon[1]
    
  end
   new_emoticons 
end 


def get_japanese_emoticon(path_file, emoticon)
  new_emoticons = load_library(path_file)
 
  meaning = new_emoticons[:get_emoticon][emoticon]
 # binding.pry

  if meaning == nil 
    return "Sorry, that emoticon was not found"
  end
  meaning 
end

def get_english_meaning(path_file, emoticon)
 new_emoticons = load_library(path_file)
 english_meaning = new_emoticons[:get_meaning][emoticon]
 if english_meaning == nil
   return "Sorry, that emoticon was not found"
 end
english_meaning
end
require 'yaml'
require 'pry'

def load_library(path)
  emo = YAML.load_file(path)
  newhash={
    'get_meaning' => {},
    'get_emoticon' => {}
  }
  emo.each do |key,value|
      newhash['get_meaning'][value[1]]= key
      newhash['get_emoticon'][value[0]] = value[1]
    end
    newhash
end


def get_japanese_emoticon(file, e_emoticon)
  lookup = load_library(file)
  j_emoticon = lookup['get_emoticon'][e_emoticon]
        
        if j_emoticon
          j_emoticon
        else
           "Sorry, that emoticon was not found"
        end
end

def get_english_meaning (file, j_emoticoon)
  lookup = load_library(file)
  e_emoticon = lookup['get_meaning'][j_emoticoon]
  if e_emoticon
    e_emoticon
  else
               "Sorry, that emoticon was not found"
  end
end

{"angel"=>["O:)", "☜(⌒▽⌒)☞"], "angry"=>[">:(", "ヽ(ｏ`皿′ｏ)ﾉ"], "bored"=>[":O", "(ΘεΘ;)"], "confused"=>["%)", "(゜.゜)"], "embarrased"=>[":$", "(#^.^#)"], "fish"=>["><>", ">゜))))彡"], "glasses"=>["8D", "(^0_0^)"], "grinning"=>["=D", "(￣ー￣)"], "happy"=>[":)", "(＾ｖ＾)"], "kiss"=>[":*", "(*^3^)/~☆"], "sad"=>[":'(", "(Ｔ▽Ｔ)"], "surprised"=>[":o", "o_O"], "wink"=>[";)", "(^_-)"]}
require "yaml"
 

def load_library(file_path)
  emoticon_file = YAML.load_file(file_path)
  new_hash = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  emoticon_file.each do |meaning, value| # key = meaning (ex. "surprise") value = jap/english emots
    english = value[0] #english emote
    japanese = value[1] #japanese emote
    new_hash["get_meaning"][japanese] = meaning
    new_hash["get_emoticon"][english] = japanese
  end 
  new_hash
end

def get_japanese_emoticon(file_path, emoticon)
  file = load_library(file_path)
  jap_equiv = file["get_emoticon"][emoticon]
  jap_equiv ? jap_equiv : "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  file = load_library(file_path)
  eng_meaning = file["get_meaning"][emoticon]
  eng_meaning ? eng_meaning : "Sorry, that emoticon was not found"
end
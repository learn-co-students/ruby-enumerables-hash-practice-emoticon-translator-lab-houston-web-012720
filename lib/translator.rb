require 'yaml'
# emoticons = YAML.load_file('lib/emoticons.yml')

# puts emoticons

def load_library(file_path)
  loadme = YAML.load_file(file_path)
  translatorhash = {get_meaning: {}, get_emoticon: {}}
  loadme.each_key do |k|
    translatorhash[:get_meaning][loadme[k][1]] = k
  end
  loadme.each_key do |k|
    translatorhash[:get_emoticon][loadme[k][0]] = loadme[k][1]
  end
  translatorhash
end

# load_library('lib/emoticons.yml')

def get_japanese_emoticon(file_path, eng_emoticon)
  if !load_library(file_path)[:get_emoticon][eng_emoticon]
    return "Sorry, that emoticon was not found"
  else
    return load_library(file_path)[:get_emoticon][eng_emoticon]
  end
end

def get_english_meaning(file_path, jap_emoticon)
  if !load_library(file_path)[:get_meaning][jap_emoticon]
    return "Sorry, that emoticon was not found"
  else
    return load_library(file_path)[:get_meaning][jap_emoticon]
  end
end

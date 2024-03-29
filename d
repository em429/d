#! /usr/bin/env ruby

###
## d is a "shortcut script" on top of dictd and gtranslate
## _______________________________________________________
## 
## IF gtranslate and dict is not in your $PATH, make sure to define
## D_GTRANSLATE_BIN_PATH and D_DICT_BIN_PATH environment variables!
##
## Basic English usage:
## --------------------
##
## d define glee club
## d thesaurus medium
## d acronym LISA
##
## See the `dictd_mode_command` function below for the supported
## modes; it's easy to add any that dictd supports.
##
##
## You can quickly translate language to language as well:
## -------------------------------------------------------
## 
## d eng hun to preen
## d eng tur beautiful
## d eng spa seaside
##
## Run `dictd -D` for a list of available language pairs.
##
##

D_GTRANSLATE_BIN_PATH = ENV["GTRANSLATAE_BIN_PATH"] || "gtranslate"
D_DICT_BIN_PATH = ENV["D_DICT_BIN_PATH"] || "dict"

# Command builder for dictd lang-to-lang translations
def dictd_translate_command(source_lang, target_lang, query)
  "dict -d fd-#{source_lang}-#{target_lang} '#{query}'"
end

# Command builder for dictd modes
# These always assume English.
# Returns the  mapped dictd command as a string.
def dictd_mode_command(selected_mode, query)
   {
    "gcide"        => "dict -d gcide '#{query}'",
    "define"       => "dict -d gcide '#{query}'",
    "def"          => "dict -d gcide '#{query}'",
    "wordnet"      => "dict -d wn '#{query}'",
    "wn"           => "dict -d wn '#{query}'",
    "thesaurus"    => "dict -d moby-thesaurus '#{query}'",
    "thesa"        => "dict -d moby-thesaurus '#{query}'",
    "acronym"      => "dict -d vera '#{query}'",
    "acro"         => "dict -d vera '#{query}'",
    "foldoc"       => "dict -d foldoc '#{query}'",
    "compsci"      => "dict -d foldoc '#{query}'",
    "hack"         => "dict -d foldoc '#{query}'",
  }[selected_mode]
end

# Queries WordNet after a confirmation prompt
def do_optional_wordnet_define(query)
  puts "\nContinue to WordNet?"
  reply = STDIN.gets.chomp

  if reply.downcase == "y"
    wordnet = "dict -d wn '#{query}'"
    puts `#{wordnet}`
    return
  end
  
end

# Queries google translate after a confirmation prompt
def do_optional_gtranslate(source_lang, target_lang, query)
  # Ask if we should continue to the next dictionary:
  puts "\nContinue to Google Translate?"
  reply = STDIN.gets.chomp

  # google-translate language codes tend to be the same as our FreeDict dictionary names,
  # so no additional mapping needs to be done. (I certainly haven't tested then alL though!)
  if reply.downcase == "y"
    gtranslate = "#{D_GTRANSLATE_BIN_PATH} -s #{source_lang} -t #{target_lang} '#{query}'"
    puts `#{gtranslate}`
    return
  end
end


###################################
#### Start of script execution ####
###################################

## First we check if it's a dictd mode query:
if ( command = dictd_mode_command(ARGV[0], ARGV[1..].join(" ")) )
  # Run the built dictd mode with our query
  puts `#{command}`

  ## Continue to Wordnet define?
  if ["def", "define"].include?(ARGV[0])
    do_optional_wordnet_define(ARGV[1..].join(" "))
  end
  
## If dictd_mode_command returns nil above, we assume its a lang-to-lang query:
elsif ( command = dictd_translate_command(ARGV[0], ARGV[1], ARGV[2..].join(" ")) )
  ## Run the built dictd translate command:
  puts `#{command}`
  ## Continue to google translate?
  do_optional_gtranslate(ARGV[0], ARGV[1], ARGV[2..].join(" "))
   
end

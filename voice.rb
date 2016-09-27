require 'pocketsphinx-ruby'

configuration = Pocketsphinx::Configuration::KeywordSpotting.new('Hello',6)
recognizer = Pocketsphinx::LiveSpeechRecognizer.new(configuration)

recognizer.recognize do |speech|
  puts speech
end


# require 'pocketsphinx-ruby' # Omitted in subsequent examples
#
# Pocketsphinx::LiveSpeechRecognizer.new.recognize do |speech|
#   puts speech
# end

require 'dotenv'
require 'language_detection'
require 'language_detection/languages/languages_options'

# Load Environment Variables
Dotenv.load

begin

  # Declare the Client instance passing in the authentication parameters
  @client = LanguageLayer::Client.new(ENV['ACCESS_KEY'])

  # We declare the options
  options = LanguageLayer::LanguagesOptions.new()

  # We make the call to detect
  response = @client.languages(options)

  # If its a success, we print a message to the user
  if !response.nil?
    puts 'SUCCESS : Languages Fetched...' << response.to_s
  end

rescue => e
  puts e.inspect

end

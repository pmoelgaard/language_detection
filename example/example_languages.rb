require 'dotenv'
require 'language_detection'

# Load Environment Variables
Dotenv.load

begin

  # Declare the Client instance passing in the authentication parameters
  @client = LanguageLayer::Client.new(ENV['ACCESS_KEY'])

  # Set the email to check, we take a random email
  query = 'I like apples & oranges.'

  # We declare the options
  options = LanguageLayer::DetectOptions.new()

  # We make the call to detect
  response = @client.detect(query, options)

  # If its a success, we print a message to the user
  if !response.nil?
    puts 'SUCCESS : Language Detected...' << response.to_s
  end

rescue => e
  puts e.inspect

end

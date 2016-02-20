require 'dotenv'
require 'language_detection'
require 'language_detection/detect/detect_options'

# Load Environment Variables
Dotenv.load

begin

  # Declare the Client instance passing in the authentication parameters
  @client = LanguageLayer::Client.new(ENV['ACCESS_KEY'])

  # Set the email to check, we take a random email
  query = 'Good afternoon, sir. How are you today?'

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

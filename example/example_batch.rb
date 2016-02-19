require 'dotenv'
require 'language_detection'
require 'language_detection/batch/batch_options'

# Load Environment Variables
Dotenv.load

begin

  # Declare the Client instance passing in the authentication parameters
  @client = LanguageLayer::Client.new(ENV['ACCESS_KEY'])

  # Set the email to check, we take a random email
  query = [
      'Good afternoon, sir. How are you today?',
      'Guten Tag mein Herr, wie geht es Ihnen?',
      'Buenos días señor, cómo está hoy?'
  ]

  # We declare the options
  options = LanguageLayer::BatchOptions.new()

  # We make the call to detect
  response = @client.batch(query, options)

  # If its a success, we print a message to the user
  if !response.nil?
    puts 'SUCCESS : Languages Detected...' << response.to_s
  end

rescue => e
  puts e.inspect

end

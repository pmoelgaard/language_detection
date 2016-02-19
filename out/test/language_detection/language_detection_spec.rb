require 'dotenv'
require 'spec_helper'
require 'language_detection'


# Load Environment Variables
Dotenv.load


describe LanguageLayer do


  it 'has a version number' do
    expect(LanguageLayer::VERSION).not_to be nil
  end


  it 'detect (simple)' do

    begin

      # Declare the Client instance passing in the authentication parameters
      @client = LanguageLayer::Client.new(ENV['ACCESS_KEY'])

      # Set the query to detect
      query = 'I like apples & oranges.'

      # We declare the options
      options = LanguageLayer::DetectOptions.new()

      # We make the call to detect
      response = @client.detect(query, options)

      # First we check the response
      expect(response).not_to be nil

    rescue => e
      puts e.inspect

    end

  end

  it 'detect (batch)' do

    begin

      # Declare the Client instance passing in the authentication parameters
      @client = LanguageLayer::Client.new(ENV['ACCESS_KEY'])

      # Set the query to detect
      query = [
          'I like apples & oranges.'
      ]

      # We declare the options
      options = LanguageLayer::BatchOptions.new()

      # We make the call to detect
      response = @client.batch(query, options)

      # First we check the response
      expect(response).not_to be nil

    rescue => e
      puts e.inspect

    end

  end

  it 'languages' do

    begin

      # Declare the Client instance passing in the authentication parameters
      @client = LanguageLayer::Client.new(ENV['ACCESS_KEY'])

      # We declare the options
      options = LanguageLayer::LanguagesOptions.new()

      # We make the call to languages
      response = @client.languages(options)

      # First we check the response
      expect(response).not_to be nil

    rescue => e
      puts e.inspect

    end

  end

end





require "httparty"
require "hashable"
require "language_detection/version"
require "language_detection/detect/detect_options"
require "language_detection/detect/detect_request"
require "language_detection/detect/detect_response"
require "language_detection/detect/detect_exception"
require "language_detection/batch/batch_options"
require "language_detection/batch/batch_request"
require "language_detection/batch/batch_response"
require "language_detection/batch/batch_exception"
require "language_detection/languages/languages_options"
require "language_detection/languages/languages_request"
require "language_detection/languages/languages_response"
require "language_detection/languages/languages_exception"


module LanguageLayer

  class Client

    include HTTParty

    base_uri 'apilayer.net/api'

    def initialize(access_key)

      if access_key.nil?
        raise LanguageLayer::MissingArgumentException.new 'access_key'
      end

      @access_key = access_key

    end


    def detect(query, options = {})

      if query.nil?
        raise LanguageLayer::MissingArgumentException.new 'query'
        return
      end

      # Create a shallow copy so we don't manipulate the original reference
      q = options.dup

      # Populate the Query
      q.access_key = @access_key
      q.query = query

      # We then create the Request
      req = LanguageLayer::DetectRequest.new(q)

      #  We create a Hash of the request so we can send it via HTTP
      req_dto = req.to_dh

      begin

        # We make the actual request
        res = self.class.get('/detect', req_dto)

        # We ensure that we tap the response so we can use the results
        res.inspect

        if (!res[LanguageLayer::DetectResponse::SUCCESS_EXPR])
          raise LanguageLayer::DetectException.new res[LanguageLayer::DetectResponse::ERROR_EXPR]
        end

        # We just return the parsed binary response
        return res.parsed_response

      rescue => e
        puts e.inspect
        return

      end
    end


    def batch(query, options = {})

      if query.nil?
        raise LanguageLayer::MissingArgumentException.new 'query'
        return
      end

      # Create a shallow copy so we don't manipulate the original reference
      q = options.dup

      # Populate the Query
      q.access_key = @access_key
      q.query = query

      # We then create the Request
      req = LanguageLayer::BatchRequest.new(q)

      #  We create a Hash of the request so we can send it via HTTP
      req_dto = req.to_dh

      begin

        # We make the actual request
        res = self.class.get('/batch', req_dto)

        # We ensure that we tap the response so we can use the results
        res.inspect

        if (!res[LanguageLayer::BatchResponse::SUCCESS_EXPR])
          raise LanguageLayer::BatchException.new res[LanguageLayer::BatchResponse::ERROR_EXPR]
        end

        # We just return the parsed binary response
        return res.parsed_response

      rescue => e
        puts e.inspect
        return

      end
    end


    def languages(options = {})

      # Create a shallow copy so we don't manipulate the original reference
      q = options.dup

      # Populate the Query
      q.access_key = @access_key

      # We then create the Request
      req = LanguageLayer::LanguagesRequest.new(q)

      #  We create a Hash of the request so we can send it via HTTP
      req_dto = req.to_dh

      begin

        # We make the actual request
        res = self.class.get('/languages', req_dto)

        # We ensure that we tap the response so we can use the results
        res.inspect

        if (!res[LanguageLayer::LanguagesResponse::SUCCESS_EXPR])
          raise LanguageLayer::LanguagesException.new res[LanguageLayer::LanguagesResponse::ERROR_EXPR]
        end

        # We just return the parsed binary response
        return res.parsed_response

      rescue => e
        puts e.inspect
        return

      end
    end

  end

end

require "language_detection/version"

module LanguageLayer

  class DetectException < Exception

    attr_accessor :error

    def initialize(error)
      self.error = error
    end

  end

end

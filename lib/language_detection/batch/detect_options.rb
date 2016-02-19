require "language_detection/version"

module LanguageLayer

  class DetectOptions

    include Hashable

    attr_accessor :access_key

    attr_accessor :query


    def initialize()
      @query = nil
    end

  end

end

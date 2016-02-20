require "language_detection/version"

module LanguageLayer

  class DetectOptions

    include Hashable

    attr_accessor :access_key

    attr_accessor :query

    attr_accessor :show_query


    def initialize()
      @query = nil
    end

  end

end

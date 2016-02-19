require "hashable"

module LanguageLayer

  class DetectRequest

    include Hashable

    attr_accessor :query

    def initialize(query = {})
      self.query = query;
    end

  end
end
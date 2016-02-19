require "language_detection/version"

module LanguageLayer

  class BatchResponse

    SUCCESS_EXPR = 'success'
    ERROR_EXPR = 'error'

    def bar
      SUCCESS_EXPR
      ERROR_EXPR
    end

  end

end

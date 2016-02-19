require "language_detection/version"

module LanguageLayer

  class DetectResponse

    SUCCESS_EXPR = 'success'
    ERROR_EXPR = 'error'

    def bar
      SUCCESS_EXPR
      ERROR_EXPR
    end

  end

end

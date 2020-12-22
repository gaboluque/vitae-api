# frozen_string_literal: true

module HandleError
  # Custom error
  class CustomError < StandardError
    attr_reader :message, :klass, :kind

    def initialize(message, klass, kind)
      super()
      @message = message
      @klass = klass
      @kind = kind
    end
  end
end

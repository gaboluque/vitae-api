# frozen_string_literal: true

module HandleError
  # Validation Error
  class ValidationError < CustomError
    def initialize(msg, klass)
      super(msg, klass, :validation)
    end
  end
end

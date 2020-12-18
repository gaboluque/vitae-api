# frozen_string_literal: true

module HandleError
  class ValidationError < CustomError
    def initialize(msg, klass)
      super(msg, klass, :validation)
    end
  end
end

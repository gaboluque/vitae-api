# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::API
  include Pundit
  include DeviseResponses
  include HandleError::ErrorHandler

  def format_result(entity, msg = nil, extra = nil, complement = nil)
    result = {}
    result[:success] = true
    result[:message] = msg
    result[:type] = 'success'
    result[:extra] = extra.nil? ? {} : extra.call
    result[:complement] = complement.nil? ? {} : complement.call
    result[:entity] = entity
    result
  end
end

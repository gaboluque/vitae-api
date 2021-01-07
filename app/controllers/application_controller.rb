# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::API
  include Pundit
  include DeviseResponses
  include HandleError::ErrorHandler

  def format_result(data: nil, msg: nil)
    result = {}
    result[:message] = msg
    result[:type] = 'success'
    result[:data] = data
    result
  end
end

# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::API
  include Pundit
  include DeviseResponses
  include HandleError::ErrorHandler
end

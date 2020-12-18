# frozen_string_literal: true

class CustomAuthFailure < Devise::FailureApp
  def respond
    self.status = 401
    self.content_type = 'application/json'
    self.response_body = { success: false,
                           code: 401,
                           info: { message: i18n_message, type: 'error' } }.to_json
  end
end

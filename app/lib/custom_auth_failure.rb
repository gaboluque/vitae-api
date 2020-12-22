# frozen_string_literal: true

# Custom Auth failure
class CustomAuthFailure < Devise::FailureApp
  include CustomResponse

  def respond
    self.status = 401
    self.content_type = 'application/json'
    self.response_body = { success: false,
                           code: 411,
                           info: { message: format_message(i18n_message), type: 'error' } }.to_json
  end
end

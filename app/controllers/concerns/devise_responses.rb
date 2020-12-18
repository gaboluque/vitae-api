# frozen_string_literal: true

# Devise Responses
module DeviseResponses
  def info_response(success, message, type)
    render json: { success: success,
                   info: info_item(type, message) }
  end

  def auth_response(user, message, token = request.env['warden-jwt_auth.token'])
    response = { success: true,
                 auth: auth_item(token, user),
                 info: info_item('success', message) }
    render json: response
  end

  private

  def info_item(type, message)
    {
      message: message,
      type: type
    }
  end

  def auth_item(token, user)
    {
      logged: true,
      jwt_token: token,
      admin: user.admin,
      email: user.email,
      env: ENV.fetch('RAILS_ENV')
    }
  end
end

# frozen_string_literal: true

module Api::V1::Auth
  # Sessions controller
  class SessionsController < Devise::SessionsController
    # before_action :configure_sign_in_params, only: [:create]

    # GET /auth/sign_in
    # def new
    #   super
    # end

    # POST /auth/sign_in
    # def create
    #   super
    # end

    # DELETE /auth/sign_out
    # def destroy
    #   super
    # end

    # POST /auth/verify-token
    def verify_token
      respond_with(current_user)
    end

    # protected

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_in_params
    #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    # end

    private

    def respond_with(resource, _opts = {})
      auth_response(resource, 'Welcome')
    end

    def respond_to_on_destroy
      head :no_content
    end
  end
end

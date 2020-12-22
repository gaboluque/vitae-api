# frozen_string_literal: true

module Api::V1::Auth
  # Confirmations controller
  class ConfirmationsController < Devise::ConfirmationsController
    # GET /resource/confirmation/new
    # def new
    #   super
    # end

    # POST /resource/confirmation
    # def create
    #   super
    # end

    # GET /resource/confirmation?confirmation_token=abcdef
    # def show
    #   super
    # end

    # protected

    # The path used after resending confirmation instructions.
    # def after_resending_confirmation_instructions_path_for(resource_name)
    #   super(resource_name)
    # end

    # The path used after confirmation.
    # def after_confirmation_path_for(resource_name, resource)
    #   super(resource_name, resource)
    # end

    private

    def respond_with(resource, _opts = {})
      if resource.blank?
        info_response(true, find_message('send_instructions'), 'success')
      elsif resource.is_a?(ActiveModel::Errors)
        info_response(false, resource.full_messages.first, 'error')
      elsif resource.errors.any?
        info_response(false, resource.errors.full_messages.first, 'error')
      else
        auth_response(resource,
                      find_message('confirmed'),
                      Warden::JWTAuth::UserEncoder.new.call(resource, :user, nil)[0])
      end
    end

    def respond_with_navigational(*args, &block)
      respond_with(*args)
    end

  end
end

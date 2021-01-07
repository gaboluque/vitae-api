# frozen_string_literal: true

module UserService
  # User updater service
  class UserUpdater < ApplicationService
    attr_reader :user, :user_params, :change_password

    def initialize(user, user_params)
      super()
      @user = user
      @user_params = user_params
    end

    def execute
      ActiveRecord::Base.transaction do
        verify_business_rules
        @user_params[:profile_attributes][:avatar] = updated_avatar
        @user.update!(@user_params)
      end
    end

    private

    def verify_business_rules
      return unless @user[:email] != @user_params[:email]

      validate_element(!User.exists?(email: @user_params[:email]),
                       'UserExists',
                       :bool)
    end

    def updated_avatar
      @user_params[:profile_attributes][:avatar] ||= @user.profile.avatar.blob
    end
  end
end

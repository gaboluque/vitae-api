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
        @user.update!(@user_params)
      end
      format_result(nil, 'Usuario editado satisfactoriamente', users_query)
    end

    private

    def verify_business_rules
      return unless @user[:email] != @user_params[:email]

      validate_element(!User.exists?(email: @user_params[:email]),
                       'UserExists',
                       :bool)
    end

    def users_query
      -> { UserService::UserFetcher.execute[:entity] }
    end
  end
end

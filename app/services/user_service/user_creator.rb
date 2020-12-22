# frozen_string_literal: true

module UserService
  # User creator service
  class UserCreator < ApplicationService
    attr_reader :user_params

    def initialize(user_params)
      super()
      @user_params = user_params
    end

    def execute
      ActiveRecord::Base.transaction do
        verify_business_rules
        @user_params[:admin] = false
        User.create!(@user_params)
      end
      format_result(nil, 'UserCreated', users_query)
    end

    private

    def verify_business_rules
      validate_element(!User.exists?(email: @user_params[:email]),
                       'UserEmailExists',
                       :bool)
    end

    def users_query
      -> { UserService::UserFetcher.execute[:entity] }
    end
  end
end

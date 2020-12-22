# frozen_string_literal: true

module UserService
  # User destroyer service
  class UserDestroyer < ApplicationService
    attr_reader :user

    def initialize(user)
      super()
      @user = user
    end

    def execute
      ActiveRecord::Base.transaction do
        @user.destroy!
      end
      format_result(nil, 'UserDeleted', users_query)
    end

    private

    def users_query
      -> { UserService::UserFetcher.execute[:entity] }
    end
  end
end

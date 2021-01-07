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
    end
  end
end

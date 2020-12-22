# frozen_string_literal: true

module UserService
  # User fetcher service
  class UserFetcher < ApplicationService
    def initialize
      super()
      @query = User.includes(:profile).where.not(admin: true)
    end

    def execute
      format_result(@query, nil)
    end
  end
end

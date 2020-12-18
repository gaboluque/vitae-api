# frozen_string_literal: true

module UserService
  class UserFetcher < ApplicationService
    def initialize
      @query = User.includes(:profile).where.not(admin: true)
    end

    def execute
      format_result(@query, nil)
    end
  end
end

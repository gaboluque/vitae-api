# frozen_string_literal: true

module ExperienceService
  # Experience fetcher service
  class ExperienceFetcher < ApplicationService
    attr_reader :user

    def initialize(user)
      super()
      @user = user
    end

    def execute
      @user.experiences
    end
  end
end

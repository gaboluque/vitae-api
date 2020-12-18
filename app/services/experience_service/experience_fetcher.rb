# frozen_string_literal: true

module ExperienceService
  class ExperienceFetcher < ApplicationService
    attr_reader :user

    def initialize(user)
      @user = user
    end

    def execute
      format_result(@user.experiences, nil)
    end
  end
end

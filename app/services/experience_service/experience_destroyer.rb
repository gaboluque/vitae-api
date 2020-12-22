# frozen_string_literal: true

module ExperienceService
  # Experience destroyer service
  class ExperienceDestroyer < ApplicationService
    attr_reader :user, :experience

    def initialize(user, experience)
      super()
      @user = user
      @experience = experience
    end

    def execute
      ActiveRecord::Base.transaction do
        @experience.destroy!
      end
      format_result(nil, 'ExperienceDeleted', experiences_query)
    end

    private

    def experiences_query
      -> { ExperienceService::ExperienceFetcher.execute(@user)[:entity] }
    end
  end
end

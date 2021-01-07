# frozen_string_literal: true

module ExperienceService
  # Experience destroyer service
  class ExperienceDestroyer < ApplicationService
    attr_reader :experience

    def initialize(experience)
      super()
      @experience = experience
    end

    def execute
      ActiveRecord::Base.transaction do
        @experience.destroy!
      end
    end
  end
end

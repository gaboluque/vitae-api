# frozen_string_literal: true

module ExperienceService
  # Experience updater service
  class ExperienceUpdater < ApplicationService
    attr_reader :user, :experience, :experience_params

    def initialize(user, experience, experience_params)
      super()
      @user = user
      @experience = experience
      @experience_params = experience_params
    end

    def execute
      ActiveRecord::Base.transaction do
        @experience_params[:start_date] = "#{@experience_params[:start_year]}-#{@experience_params[:start_month]}-01"
        if @experience_params[:end_year]
          @experience_params[:end_date] =
            "#{@experience_params[:end_year]}-#{@experience_params[:end_month]}-01"
        end
        @experience.update!(@experience_params.except(:start_year, :start_month, :end_year, :end_month))
      end
      format_result(nil, 'ExperienceUpdated', experiences_query)
    end

    private

    def experiences_query
      -> { ExperienceService::ExperienceFetcher.execute(@user)[:entity] }
    end
  end
end

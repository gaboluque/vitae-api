# frozen_string_literal: true

module ExperienceService
  class ExperienceCreator < ApplicationService
    attr_reader :user, :experience_params

    def initialize(user, experience_params)
      @user = user
      @experience_params = experience_params
    end

    def execute
      ActiveRecord::Base.transaction do
        @experience_params[:start_date] = "#{@experience_params[:start_year]}-#{@experience_params[:start_month]}-01"
        if @experience_params[:end_year]
          @experience_params[:end_date] =
            "#{@experience_params[:end_year]}-#{@experience_params[:end_month]}-01"
        end
        @experience = Experience.new(@experience_params.except(:start_year, :start_month, :end_year, :end_month))
        @experience.user = @user
        @experience.save!
      end
      format_result(nil, 'Experiencia creada correctamente', experiences_query)
    end

    private

    def experiences_query
      -> { ExperienceService::ExperienceFetcher.execute(@user)[:entity] }
    end
  end
end

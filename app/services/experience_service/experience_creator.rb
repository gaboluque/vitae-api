# frozen_string_literal: true

module ExperienceService
  # Experience creator service
  class ExperienceCreator < ApplicationService
    attr_reader :user, :experience_params

    def initialize(user, experience_params)
      super()
      @user = user
      @experience_params = experience_params
    end

    def execute
      set_experience_dates

      ActiveRecord::Base.transaction do
        @experience = Experience.new(@experience_params.except(:start_year, :start_month, :end_year, :end_month))
        @experience.user_id = @user.id
        @experience.save!
      end
    end

    private

    def set_experience_dates
      @experience_params[:start_date] = "#{@experience_params[:start_year]}-#{@experience_params[:start_month]}-01"

      return unless @experience_params[:end_year]

      @experience_params[:end_date] =
        "#{@experience_params[:end_year]}-#{@experience_params[:end_month]}-01"
    end
  end
end

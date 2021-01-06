# frozen_string_literal: true

module Api::V1
  # Experiences controller
  class ExperiencesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_experience, only: %i[show update destroy]

    def index
      experiences = ExperienceService::ExperienceFetcher.execute(current_user)
      @result = format_result(experiences, nil)
    end

    def show
    end

    def create
      authorize Experience
      @result = ExperienceService::ExperienceCreator.execute(current_user, permitted_params)
    end

    def update
      authorize @experience
      @result = ExperienceService::ExperienceUpdater.execute(current_user, @experience, permitted_params)
    end

    def destroy
      authorize @experience
      @result = ExperienceService::ExperienceDestroyer.execute(current_user, @experience)
    end

    private

    def permitted_params
      permitted_attributes(Experience)
    end

    def set_experience
      @experience = Experience.find(params[:id])
    end

  end
end


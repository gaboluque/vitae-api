# frozen_string_literal: true

module Api::V1
  # Experiences controller
  class ExperiencesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_experience, only: %i[show update destroy]

    def index
      @result = format_result(data: current_user.experiences)
    end

    def show
    end

    def create
      authorize Experience
      ExperienceService::ExperienceCreator.execute(current_user, permitted_params)
      @result = format_result(msg: 'ExperienceCreated')
      render status: :created
    end

    def update
      authorize @experience
      ExperienceService::ExperienceUpdater.execute(@experience, permitted_params)
      @result = format_result(msg: 'ExperienceUpdated')
    end

    def destroy
      authorize @experience
      ExperienceService::ExperienceDestroyer.execute(@experience)
      @result = format_result(msg: 'ExperienceDeleted')
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


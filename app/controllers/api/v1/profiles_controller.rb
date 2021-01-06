# frozen_string_literal: true

module Api::V1
  # Profiles controller
  class ProfilesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_profile

    def show
    end

    def update
      authorize @profile
      @result = ProfileService::ProfileUpdater.execute(current_user, permitted_attributes(Profile))
    end

    private

    def set_profile
      @profile = current_user.profile
    end
  end
end

# frozen_string_literal: true

module Api::V1
  # Profiles controller
  class ProfilesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_profile, only: %i[update show]

    def show
    end

    def update
      authorize @profile
      ProfileService::ProfileUpdater.execute(current_user, permitted_attributes(Profile))
      @result = format_result(msg: 'ProfileUpdated')
    end

    private

    def set_profile
      @profile = current_user.profile
    end
  end
end

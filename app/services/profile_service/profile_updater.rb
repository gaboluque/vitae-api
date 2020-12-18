# frozen_string_literal: true

module ProfileService
  class ProfileUpdater < ApplicationService
    attr_reader :user, :profile_params

    def initialize(user, profile_params)
      @user = user
      @profile_params = profile_params
    end

    def execute
      ActiveRecord::Base.transaction do
        @user.profile.update!(@profile_params)
      end
      format_result(nil, 'Perfil editado correctamente!')
    end
  end
end
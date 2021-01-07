# frozen_string_literal: true
module Api::V1
  # Helpers Controller
  class HelpersController < ApplicationController
    before_action :authenticate_user!, except: %i[labels]

    def verify_token
      @token = request.env['warden-jwt_auth.token']
    end

    def labels
      @result = HelperService::LabelFetcher.execute(current_user, params[:kind])
    end
  end
end

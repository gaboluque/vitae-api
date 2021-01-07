# frozen_string_literal: true

module Api
  module V1
    # Users controller
    class UsersController < ApplicationController
      before_action :authenticate_user!, except: %i[create]
      before_action :set_user, only: %i[update edit destroy show]

      def index
        authorize User
        users = User.includes(:profile).where.not(admin: true)
        @result = format_result(data: users)
      end

      def show
        authorize User
      end

      def update
        authorize @user
        @result = UserService::UserUpdater.execute(@user, permitted_attributes(User))
        @result = format_result(msg: 'UserUpdated')
      end

      def destroy
        authorize @user
        UserService::UserDestroyer.execute(@user)
        @result = format_result(msg: 'UserDeleted')
      end

      private

      def set_user
        @user = User.find(params[:id])
      end
    end
  end
end

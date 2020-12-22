# frozen_string_literal: true

module Api
  module V1
    # Users controller
    class UsersController < ApplicationController
      before_action :authenticate_user!, except: %i[create]
      before_action :set_user, only: %i[update edit destroy]

      def index
        authorize User
        @result = UserService::UserFetcher.execute
      end

      def create
        @result = UserService::UserCreator.execute(permitted_attributes(User))
      end

      def update
        authorize @user
        @result = UserService::UserUpdater.execute(@user, permitted_attributes(User))
      end

      def destroy
        authorize @user
        @result = UserService::UserDestroyer.execute(@user)
      end

      def edit
        authorize @user
      end

      private

      def set_user
        @user = User.find(params[:id])
      end
    end
  end
end

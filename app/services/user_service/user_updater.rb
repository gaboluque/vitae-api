# frozen_string_literal: true

module UserService
  class UserUpdater < ApplicationService
    attr_reader :user, :user_params, :change_password

    def initialize(user, user_params)
      @user = user
      @user_params = user_params
    end

    def execute
      ActiveRecord::Base.transaction do
        verify_business_rules
        @user.update!(@user_params)
      end
      format_result(nil, 'Usuario editado satisfactoriamente', users_query)
    end

    private

    def verify_business_rules
      if @user[:email] != @user_params[:email]
        validate_element(!User.exists?(email: @user_params[:email]),
                         'Ya existe un usuario con este correo!',
                         :bool)
      end
      if @user.hub[:tag] != @user_params[:hub_attributes][:tag]
        validate_element(!Hub.exists?(tag: @user_params[:hub_attributes][:tag]),
                         'Ya existe un usuario con ese tag!',
                         :bool)
      end
    end

    def users_query
      -> { UserService::UserFetcher.execute[:entity] }
    end
  end
end

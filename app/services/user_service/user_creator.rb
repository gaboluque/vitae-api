# frozen_string_literal: true

module UserService
  class UserCreator < ApplicationService
    attr_reader :user_params

    def initialize(user_params)
      @user_params = user_params
    end

    def execute
      ActiveRecord::Base.transaction do
        verify_business_rules
        @user_params[:admin] = false
        @user_params[:hub_attributes][:kind] = 'hub_a'
        @user_params[:hub_attributes][:color_a] = '#FFFFFF'
        @user_params[:hub_attributes][:color_b] = '#000000'
        User.create!(@user_params)
      end
      format_result(nil, 'Usuario creado correctamente', users_query)
    end

    private

    def verify_business_rules
      validate_element(!User.exists?(email: @user_params[:email]),
                       'Ya existe un usuario con este correo!',
                       :bool)
      validate_element(!Hub.exists?(tag: @user_params[:hub_attributes][:tag]),
                       'Ya existe un usuario con ese tag!',
                       :bool)
    end

    def users_query
      -> { UserService::UserFetcher.execute[:entity] }
    end
  end
end

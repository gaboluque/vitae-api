# frozen_string_literal: true

# Rails routes
Rails.application.routes.draw do
  scope module: :api, defaults: { format: :json } do
    scope module: :v1, constraints: ApiVersion.new('v1', true) do
      devise_for :users, skip: %i[sessions registrations confirmations passwords]
      as :user do
        post 'auth/log-in', to: 'auth/sessions#create'
        post 'auth/verify-token', to: 'auth/sessions#verify_token'
        post 'auth/sign-up', to: 'auth/registrations#create'
      end
      
      resources :users
      resources :experiences
    end
  end
end

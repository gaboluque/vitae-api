# frozen_string_literal: true

# Rails routes
Rails.application.routes.draw do
  scope module: :api, defaults: { format: :json } do
    scope module: :v1, constraints: ApiVersion.new('v1', true) do
      devise_for :users, skip: %i[sessions registrations]

      as :user do
        post 'log-in', to: 'sessions#create'
      end

      # Users
      get 'users', to: 'users#index'
      post 'users', to: 'users#create'
      get 'users/:id', to: 'users#edit'
      put 'users/:id', to: 'users#update'
      delete 'users/:id', to: 'users#destroy'
    end
  end
end

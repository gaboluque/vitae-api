# frozen_string_literal: true

module Api
  module V1
    # Sessions controller
    class SessionsController < Devise::SessionsController
      private

      def respond_with(resource, _opts = {})
        auth_response(resource)
      end

      def respond_to_on_destroy
        head :no_content
      end
    end
  end
end

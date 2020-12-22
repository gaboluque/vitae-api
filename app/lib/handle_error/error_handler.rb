# frozen_string_literal: true

module HandleError
  # Error handler
  module ErrorHandler
    def self.included(clazz)
      clazz.class_eval do
        rescue_from Exception do |e|
          fatal_error(e)
        end
        rescue_from ActionController::ParameterMissing, with: :parameters_missing
        rescue_from ActionController::RoutingError, with: :route_not_found
        rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
        rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
        rescue_from ArgumentError, with: :argument_error
        rescue_from ActiveRecord::RecordInvalid, with: :invalid_record
        rescue_from HandleError::ValidationError, with: :validation_error
      end
    end

    private

    def respond(message, status, _exception = '')
      Rails.logger.debug message
      render json: { success: false,
                     code: status,
                     info: {
                       message: message,
                       type: 'error'
                     } }, status: status
    end

    def invalid_record(exception)
      respond(exception.record.errors.messages.map { |_, v| v.join(',') }.join(','), 400)
    end

    def argument_error(exception)
      respond(exception.message, 400)
    end

    def validation_error(exception)
      Rails.logger.debug("#{exception.klass} (#{exception.kind}) - #{exception.message}")
      respond(exception.message, 400)
    end

    def record_not_found
      respond('RecordNotFound', 404)
    end

    def parameters_missing
      respond('ParametersMissing', 400)
    end

    def user_not_authorized
      respond('UserNotAuthorized', 401)
    end

    def route_not_found
      respond('RouteNotFound', 404)
    end

    def fatal_error(exception)
      Rails.logger.debug(exception)
      respond(
        'ApplicationError',
        500,
        "#{exception.class} - #{exception.message}"
      )
    end
  end
end

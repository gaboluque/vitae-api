# frozen_string_literal: true

# Application Service
class ApplicationService
  def self.execute(*args, &block)
    new(*args, &block).execute
  end

  def format_result(entity, msg = nil, extra = nil, complement = nil)
    result = {}
    result[:success] = true
    result[:message] = msg
    result[:type] = 'success'
    result[:extra] = extra.nil? ? {} : extra.call
    result[:complement] = complement.nil? ? {} : complement.call
    result[:entity] = entity
    result
  end

  def validate_element(element, message, kind, expected = nil)
    raise HandleError::ValidationError.new(message, self.class.to_s) if check_validation(element, kind, expected)
  end

  def check_validation(element, kind, expected = nil) # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/MethodLength
    case kind
    when :bool
      !element
    when :blank
      element.blank?
    when :not_blank
      element.present?
    when :complete_array
      element&.any?(&:blank?)
    when :size
      element&.length != expected
    when :size_less_than
      element && element.length >= expected
    when :size_greater_than
      element && element.length < expected
    when :less_than
      element >= expected
    when :greater_than
      element < expected
    when :exclude
      element.exclude?(expected)
    when :include
      element.include?(expected)
    when :equal
      element == expected
    when :different
      element != expected
    when :send
      element.send(expected)
    else
      false
    end
  end
end

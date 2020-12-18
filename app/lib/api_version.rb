# frozen_string_literal: true

# Api Version module
class ApiVersion
  attr_reader :version, :default

  def initialize(version, default = false)
    @version = version
    @default = default
  end

  def matches?(request)
    check_headers(request.headers) || default
  end

  def check_headers(headers)
    accept = headers[:accept]
    accept&.include?("vitae.api.#{version}")
  end
end

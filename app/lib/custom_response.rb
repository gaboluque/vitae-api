# frozen_string_literal: true

# Custom response
module CustomResponse

  def format_message(message)
    message.gsub(/\s(.)/) { |e| Regexp.last_match(1).upcase }
  end
end

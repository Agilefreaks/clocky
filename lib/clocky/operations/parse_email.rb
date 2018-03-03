# frozen_string_literal: true

require 'clocky/operation'
require 'base64'

module Clocky
  module Operations
    class ParseEmail < Operation
      def call(authorization_header)
        email = Base64.decode64(authorization_header.split.last)
        Right(email)
      end
    end
  end
end


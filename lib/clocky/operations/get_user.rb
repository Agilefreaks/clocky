# frozen_string_literal: true

require 'clocky/operation'
require 'clocky/repositories/user_repo'

module Clocky
  module Operations
    class GetUser < Operation
      include Import['repositories.user_repo']

      def call(email)
        Right(user_repo.by_email(email))
      end
    end
  end
end


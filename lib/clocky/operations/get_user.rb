# frozen_string_literal: true

require 'clocky/operation'
require 'clocky/domain/user'

module Clocky
  module Operations
    class GetUser < Operation
      include Import['repositories.user_repo']

      def call(email)
        user = Clocky::User.new(user_repo.by_email(email))

        user ? Right(user) : Left('None')
      end
    end
  end
end


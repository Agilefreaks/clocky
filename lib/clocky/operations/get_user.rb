# frozen_string_literal: true

require 'clocky/operation'
require 'clocky/domain/user'
require 'clocky/import'

module Clocky
  module Operations
    class GetUser < Operation
      include Import['repositories.user_repo']

      def call(email)
        user = user_repo.by_email(email)

        user ? Right(Clocky::User.new(user)) : Left('None')
      end
    end
  end
end

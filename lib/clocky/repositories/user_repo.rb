# frozen_string_literal: true

require 'clocky/repository'

module Clocky
  module Repositories
    class UserRepo < Clocky::Repository[:users]
      commands :create

      def by_email(email)
        users
          .where(email: email)
          .map_with(:user_mapper)
          .one
      end
    end
  end
end

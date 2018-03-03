# frozen_string_literal: true

require 'clocky/repository'
require 'clocky/domain/user'

module Clocky
  module Repositories
    class UserRepo < Clocky::Repository[:users]
      def by_email(email)
        users
          .where(email: email)
          .map_with(:user_mapper)
          .map_to(Clocky::User)
          .one!
      end
    end
  end
end
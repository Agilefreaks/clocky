# frozen_string_literal: true

require 'clocky/repository'

module Clocky
  module Repositories
    class UserRepo < Clocky::Repository[:users]
      def by_email(email)
        users.where(email: email).one!
      end
    end
  end
end
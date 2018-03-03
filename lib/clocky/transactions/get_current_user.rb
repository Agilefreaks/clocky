# frozen_string_literal: true

require 'clocky/transaction'

module Clocky
  module Transactions
    class GetCurrentUser < Transaction
      step :parse_email, with: 'operations.parse_email'
      step :get_user, with: 'operations.get_user'
    end
  end
end

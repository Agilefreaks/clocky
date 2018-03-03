# frozen_string_literal: true

require 'clocky/transaction'

module Clocky
  module Transactions
    class Checkin < Transaction
      step :check_type, with: 'operations.checkin.check_type'
      step :create_entry, with: 'operations.checkin.create_entry'
    end
  end
end

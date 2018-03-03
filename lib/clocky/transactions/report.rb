# frozen_string_literal: true

require 'clocky/transaction'
require 'clocky/import'

module Clocky
  module Transactions
    class Report < Transaction
      include Import['repositories.entry_repo']
      step :process

      def process(_input)
        Right(entry_repo.for_today)
      end
    end
  end
end

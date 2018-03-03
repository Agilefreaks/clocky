# frozen_string_literal: true

require 'dry/transaction'

module Clocky
  class Transaction
    include Dry::Transaction(container: Container)
  end
end
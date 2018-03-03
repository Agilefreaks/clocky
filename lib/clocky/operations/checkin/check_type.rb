# frozen_string_literal: true

require 'clocky/operation'

module Clocky
  module Operations
    module Checkin
      class CheckType < Operation
        def call(params)
          Right(params)
        end
      end
    end
  end
end
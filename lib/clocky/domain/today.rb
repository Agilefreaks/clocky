# frozen_string_literal: true

require 'types'

module Clocky
  class Today < Dry::Struct::Value
    attribute :id, Types::Strict::Int
    attribute :type, Types::Strict::String
    attribute :time, Types::Strict::Time
    attribute :message, Types::Strict::String.default('Uhu!')
  end
end

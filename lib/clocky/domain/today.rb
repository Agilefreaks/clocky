# frozen_string_literal: true

require 'types'

module Clocky
  class Today < Dry::Struct::Value
    EntryTypes = Types::Strict::String.enum('start', 'stop')

    attribute :id, Types::Strict::Int
    attribute :type, EntryTypes
    attribute :time, Types::Strict::Time
    attribute :message, Types::Strict::String.default('Uhu!')
  end
end

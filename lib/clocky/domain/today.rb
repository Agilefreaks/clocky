# frozen_string_literal: true

require 'types'
require 'clocky/domain/user'

module Clocky
  class Today < Dry::Struct::Value
    constructor_type :schema

    EntryTypes = Types::Strict::String.enum('start', 'stop')

    attribute :id, Types::Strict::Int
    attribute :type, EntryTypes
    attribute :time, Types::Strict::Time
    attribute :message, Types::Strict::String.default('Uhu!')
    attribute :user, Clocky::User.optional
  end
end

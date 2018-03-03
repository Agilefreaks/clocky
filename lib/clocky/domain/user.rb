# frozen_string_literal: true

require 'types'

module Clocky
  class User < Dry::Struct::Value
    attribute :id, Types::Strict::Int
    attribute :email, Types::Strict::String
  end
end

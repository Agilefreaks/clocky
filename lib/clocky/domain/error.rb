require 'types'

module Clocky
  class Error < Dry::Struct::Value
    constructor_type :schema

    attribute :id, Types::Strict::Int.optional
    attribute :title, Types::Strict::String.optional
    attribute :detail, Types::Strict::String.optional
  end
end

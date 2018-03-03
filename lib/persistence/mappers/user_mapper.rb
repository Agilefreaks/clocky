# frozen_string_literal: true

require 'rom/transformer'

module Persistence
  module Mappers
    class UserMapper < ROM::Transformer
      relation :users
      register_as :user_mapper

      map_array do
        symbolize_keys
      end
    end
  end
end

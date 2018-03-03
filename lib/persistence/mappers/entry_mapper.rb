# frozen_string_literal: true

require 'rom/transformer'

module Persistence
  module Mappers
    class EntryMapper < ROM::Transformer
      relation :entries
      register_as :entry_mapper

      map_array do
        symbolize_keys
        rename_keys created_at: :time
      end
    end
  end
end

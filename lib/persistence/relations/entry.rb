# frozen_string_literal: true

module Persistence
  module Relations
    class Entry < ROM::Relation[:sql]
      schema(:entries, infer: true) do
        associations do
          belongs_to :user
        end
      end
    end
  end
end
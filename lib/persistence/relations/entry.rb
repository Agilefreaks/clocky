# frozen_string_literal: true

module Persistence
  module Relations
    class Entry < ROM::Relation[:sql]
      schema(:entries, infer: true)
    end
  end
end
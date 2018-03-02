# frozen_string_literal: true

module Test
  module DatabaseHelpers
    module_function

    def rom
      Clocky::Container['persistence.rom']
    end

    def db
      Clocky::Container['persistence.db']
    end
  end
end

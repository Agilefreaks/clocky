# frozen_string_literal: true

module Clocky
  class ApiInfo
    attr_reader :version

    def initialize
      @version = '1.0'
    end
  end
end

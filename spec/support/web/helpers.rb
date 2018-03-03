# frozen_string_literal: true

require 'json'

module Test
  module WebHelpers
    module_function

    def app
      Clocky::Web.app
    end

    def response
      JSON.parse(last_response.body)
    end
  end
end

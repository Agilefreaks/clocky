# frozen_string_literal: true

require 'clocky/view/controller'
require 'clocky/resources/serializable_error'

module Clocky
  module Views
    class Errors < Clocky::View::Controller
      configure do |config|
        config.klass = { 'Clocky::Error': Resources::SerializableError }
      end

      def call(options)
        renderer.render_errors(options[:data], class: klass)
      end
    end
  end
end

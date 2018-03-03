# frozen_string_literal: true

# auto_register: false

require 'clocky/container'

module Clocky
  module View
    class Controller
      extend Dry::Configurable

      setting :renderer
      setting :klass
      setting :include
      setting :fields
      setting :expose

      configure do |config|
        config.renderer = Container['jsonapi.renderer']
      end

      def renderer
        self.class.config.renderer
      end

      def klass
        self.class.config.klass
      end

      def call(options)
        renderer.render(options[:data], class: klass)
      end
    end
  end
end

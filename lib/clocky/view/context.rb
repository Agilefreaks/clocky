# frozen_string_literal: true

module Clocky
  module View
    class Context
      attr_reader :attrs

      def initialize(attrs = {})
        @attrs = attrs
      end

      def with(new_attrs)
        self.class.new(attrs.merge(new_attrs))
      end

      def url_helpers
        self[:url_helpers]
      end

      private

      def [](name)
        attrs.fetch(name)
      end
    end
  end
end

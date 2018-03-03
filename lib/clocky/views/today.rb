# frozen_string_literal: true

require 'clocky/view/controller'
require 'clocky/resources/serializable_today'

module Clocky
  module Views
    class Today < Clocky::View::Controller
      configure do |config|
        config.klass = { 'Clocky::Today': Resources::SerializableToday }
      end
    end
  end
end

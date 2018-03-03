# frozen_string_literal: true

require 'clocky/view/controller'
require 'clocky/resources/serializable_today'
require 'clocky/resources/serializable_user'

module Clocky
  module Views
    class Today < Clocky::View::Controller
      configure do |config|
        config.klass = { 'Clocky::Today': Resources::SerializableToday, 'Clocky::User': Resources::SerializableUser }
        config.include = [ :user ]
      end
    end
  end
end

# frozen_string_literal: true

require 'clocky/view/controller'

module Clocky
  module Views
    class Welcome < Clocky::View::Controller
      configure do |config|
        config.template = 'welcome'
      end
    end
  end
end

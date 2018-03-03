# frozen_string_literal: true

require 'clocky/domain/today'

module Clocky
  class Web
    route 'today' do |r|
      r.put do
        r.jsonapi 'today', data: Clocky::Today.new
      end
    end
  end
end

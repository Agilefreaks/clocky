# frozen_string_literal: true

require 'clocky/domain/today'

class Clocky::Web
  route "today" do |r|
    r.post do
      r.jsonapi 'today', { data: Clocky::Today.new }
    end
  end
end

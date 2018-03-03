# frozen_string_literal: true

module Clocky
  class UrlHelpers
    attr_reader :host

    def initialize(env)
      @host = "#{env['HTTP_HOST']}/"
    end

    def checkin_url
      "#{host}today"
    end

    def entry_url(id)
      "#{host}today/#{id}"
    end
  end
end

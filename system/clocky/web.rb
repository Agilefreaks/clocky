# frozen_string_literal: true

require 'dry/web/roda/application'
require_relative 'container'
require 'clocky/domain/api_info'

module Clocky
  class Web < Dry::Web::Roda::Application
    configure do |config|
      config.container = Container
      config.routes = 'web/routes'
    end

    opts[:root] = Pathname(__FILE__).join('../..').realpath.dirname

    use Rack::Session::Cookie, key: 'clocky.session', secret: self['settings'].session_secret

    plugin :json_api
    plugin :json, content_type: 'application/vnd.api+json'
    plugin :error_handler
    plugin :multi_route

    route do |r|
      r.multi_route

      r.root do
        { jsonapi: { version: ApiInfo.new.version } }
      end
    end

    error do |e|
      self.class[:rack_monitor].instrument(:error, exception: e)
      raise e
    end

    # Request-specific options for dry-view context object
    def view_context_options
      {
        url_helper: nil
      }
    end

    load_routes!
  end
end

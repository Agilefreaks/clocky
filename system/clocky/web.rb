# frozen_string_literal: true

require 'memoizable'
require 'dry/web/roda/application'
require_relative 'container'
require 'clocky/domain/api_info'

module Clocky
  class Web < Dry::Web::Roda::Application
    include Memoizable

    configure do |config|
      config.container = Container
      config.routes = 'web/routes'
    end

    opts[:root] = Pathname(__FILE__).join('../..').realpath.dirname

    plugin :json_api
    plugin :json, content_type: 'application/vnd.api+json'
    plugin :error_handler
    plugin :multi_route
    plugin :request_headers

    route do |r|
      r.multi_route

      r.root do
        p(current_user)
        { jsonapi: { version: ApiInfo.new.version } }
      end
    end

    def current_user
      self.class['transactions.get_current_user'].(request.headers['Authorization'])
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

    private

    def authorize
      self.class['authorization'].(current_user, request)
    end
  end
end

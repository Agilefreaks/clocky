# frozen_string_literal: true

require 'memoizable'
require 'dry/web/roda/application'
require_relative 'container'
require 'clocky/domain/api_info'
require 'clocky/url_helpers'

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
    plugin :json_parser, content_type: 'application/vnd.api+json'
    plugin :error_handler
    plugin :multi_route
    plugin :request_headers
    plugin :symbol_status
    plugin :hooks
    plugin :symbolized_params

    route do |r|
      r.multi_route

      r.root do
        { jsonapi: { version: ApiInfo.new.version } }
      end
    end

    def current_user
      self.class['transactions.get_current_user'].call(request.headers['Authorization']) do |result|
        result.success do |user|
          user
        end
        result.failure do
          nil
        end
      end
    end
    memoize :current_user

    def params_with_user(params)
      { params: params, current_user: current_user }
    end

    error do |e|
      self.class[:rack_monitor].instrument(:error, exception: e)
      raise e
    end

    before do
    end

    # Request-specific options for dry-view context object
    def view_context_options
      {
        url_helpers: Clocky::UrlHelpers.new(env)
      }
    end

    load_routes!
  end
end

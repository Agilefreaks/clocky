require "dry/web/container"
require "dry/system/components"

module Clocky
  class Container < Dry::Web::Container
    configure do
      config.name = :clocky
      config.listeners = true
      config.default_namespace = "clocky"
      config.auto_register = %w[lib/clocky]
    end

    load_paths! "lib"
  end
end

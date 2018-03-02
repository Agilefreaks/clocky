require "bundler/setup"

begin
  require "pry-byebug"
rescue LoadError
end

require_relative "clocky/container"

Clocky::Container.finalize!

require "clocky/web"

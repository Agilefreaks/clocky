# frozen_string_literal: true

require 'bundler/setup'

begin
  require 'pry-byebug'
rescue LoadError => e
  p e
end

require_relative 'clocky/container'

Clocky::Container.finalize!

require 'clocky/web'

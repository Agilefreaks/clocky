# frozen_string_literal: true

require 'clocky/repository'
require 'clocky/domain/user'

module Clocky
  module Repositories
    class EntryRepo < Clocky::Repository[:entries]
      commands :create
    end
  end
end
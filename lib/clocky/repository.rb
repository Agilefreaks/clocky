# auto_register: false

require "rom-repository"
require "clocky/container"
require "clocky/import"

module Clocky
  class Repository < ROM::Repository::Root
    include Import.args["persistence.rom"]
  end
end

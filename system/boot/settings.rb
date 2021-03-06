# frozen_string_literal: true

Clocky::Container.boot :settings, from: :system do
  before :init do
    require 'types'
  end

  settings do
    key :database_url, Types::Strict::String.constrained(filled: true)
  end
end

# frozen_string_literal: true
# See https://github.com/rom-rb/rom-factory for more.

Factory.define :entry do |f|
  f.sequence(:message) { |i| "message-#{i}" }
  f.type('start')
  f.association(:user)
  f.timestamps
end


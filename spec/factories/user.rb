# frozen_string_literal: true
# See https://github.com/rom-rb/rom-factory for more.

Factory.define :user do |f|
  f.sequence(:user) { |i| "email-#{i}@agilefreaks.com" }
  f.timestamps
end


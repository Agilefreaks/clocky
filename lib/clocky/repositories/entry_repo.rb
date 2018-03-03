# frozen_string_literal: true

require 'clocky/repository'
require 'clocky/domain/user'

module Clocky
  module Repositories
    class EntryRepo < Clocky::Repository[:entries]
      commands :create

      def for_today_by_type_and_user(user_id, type)
        now = Time.now
        beginning_of_day = Time.new(now.year, now.month, now.day, 0, 0, 0, 0)
        end_of_day = Time.new(now.year, now.month, now.day, 23, 59, 59, 0)
        entries
          .where(type: type, created_at: beginning_of_day..end_of_day, user_id: user_id)
          .one
      end
    end
  end
end
# frozen_string_literal: true

require 'clocky/repository'
require 'clocky/domain/user'
require 'persistence/mappers/entry_mapper'

module Clocky
  module Repositories
    class EntryRepo < Clocky::Repository[:entries]
      commands :create

      def for_today_by_type_and_user(user_id, type)
        entries
          .where(type: type, created_at: today, user_id: user_id)
          .one
      end

      def for_today
        aggregate(:user)
          .where(created_at: today)
          .to_a
          .map { |entry| Persistence::Mappers::EntryMapper.new.call(entry) }
          .flatten
          .map { |entry| Clocky::Today.new(entry) }
      end

      private

      def today
        now = Time.now
        beginning_of_day = Time.new(now.year, now.month, now.day, 0, 0, 0, 0)
        end_of_day = Time.new(now.year, now.month, now.day, 23, 59, 59, 0)
        beginning_of_day..end_of_day
      end
    end
  end
end

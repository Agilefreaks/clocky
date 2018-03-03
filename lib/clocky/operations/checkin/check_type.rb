# frozen_string_literal: true

require 'clocky/operation'
require 'clocky/import'
require 'clocky/domain/error'

module Clocky
  module Operations
    module Checkin
      class CheckType < Operation
        include Import['repositories.entry_repo']

        def call(params)
          user = params[:current_user]
          type = params[:params][:type]

          entry = entry_repo.for_today_by_type_and_user(user.id, type)

          if entry
            Left([Clocky::Error.new(title: 'type', detail: "An entry with #{type} already exists for this user")])
          else
            Right(params)
          end
        end
      end
    end
  end
end

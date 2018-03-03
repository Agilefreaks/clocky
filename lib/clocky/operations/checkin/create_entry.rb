# frozen_string_literal: true

require 'clocky/operation'
require 'clocky/domain/today'
require 'clocky/import'

module Clocky
  module Operations
    module Checkin
      class CreateEntry < Operation
        include Import['repositories.entry_repo']

        def call(params)
          today = Clocky::Today.new(entry_repo.create(
                                      params[:params].merge(message: 'Uhu!', user_id: params[:current_user].id)
          ))
          Right(today)
        end
      end
    end
  end
end

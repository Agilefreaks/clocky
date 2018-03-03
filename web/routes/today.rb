# frozen_string_literal: true

require 'clocky/domain/today'

module Clocky
  class Web
    route 'today' do |r|
      unless current_user
        response.status = :unauthorized
        r.halt
      end

      r.post do
        r.resolve('transactions.checkin') do |checkin|
          checkin.(params_with_user(params[:data])) do |m|
            m.success do |today|
              response.status = :created
              r.jsonapi 'today', data: today
            end
            m.failure do |errors|
              response.status = :bad_request
              r.jsonapi 'errors', data: p(errors)
            end
          end
        end
      end
    end
  end
end

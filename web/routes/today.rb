# frozen_string_literal: true

require 'clocky/domain/today'

module Clocky
  class Web
    # rubocop:disable Metrics/BlockLength
    route 'today' do |r|
      r.get do
        r.resolve('transactions.report') do |report|
          report.call({}) do |m|
            m.success do |result|
              r.jsonapi 'today', data: result
            end
            m.failure do |errors|
              response.status = :bad_request
              r.jsonapi 'errors', data: errors
            end
          end
        end
      end

      unless current_user
        response.status = :unauthorized
        r.halt
      end

      r.post do
        r.resolve('transactions.checkin') do |checkin|
          checkin.call(params_with_user(params[:data])) do |m|
            m.success do |today|
              response.status = :created
              r.jsonapi 'today', data: today
            end
            m.failure do |errors|
              response.status = :bad_request
              r.jsonapi 'errors', data: errors
            end
          end
        end
      end
    end
    # rubocop:enable Metrics/BlockLength
  end
end

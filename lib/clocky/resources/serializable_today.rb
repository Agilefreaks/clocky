# frozen_string_literal: true

module Clocky
  module Resources
    class SerializableToday < JSONAPI::Serializable::Resource
      type :today

      attribute :message do
        @object.message
      end

      attribute :time do
        @object.time
      end

      # link :checkin do
      #   @url_helper.checkin_url
      # end
      #
      # link :checkout do
      #   @url_helper.checkout_url
      # end
    end
  end
end

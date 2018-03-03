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

      link :self do
        @url_helpers.checkin_url
      end

      link :related do
        @url_helpers.entry_url(@object.id)
      end
    end
  end
end

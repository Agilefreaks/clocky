# frozen_string_literal: true

module Clocky
  module Resources
    class SerializableUser < JSONAPI::Serializable::Resource
      type :user

      attribute :email do
        @object.email
      end
    end
  end
end

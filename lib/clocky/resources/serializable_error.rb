# frozen_string_literal: true

module Clocky
  module Resources
    class SerializableError < JSONAPI::Serializable::Error
      id { @object.id }
      title { @object.title }
      detail { @object.detail }
    end
  end
end

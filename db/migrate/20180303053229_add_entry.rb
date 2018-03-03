# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table(:entries) do
      primary_key :id
      String :message
      String :type
      DateTime :created_at, null: false, default: Sequel::CURRENT_TIMESTAMP
      DateTime :updated_at, null: false, default: Sequel::CURRENT_TIMESTAMP
    end
  end
end

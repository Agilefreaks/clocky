# frozen_string_literal: true

ROM::SQL.migration do
  change do
    alter_table(:entries) do
      add_foreign_key :user_id, :users
    end
  end
end

Sequel.migration do
  change do
    create_table(:states) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at

      String :name
      String :abbr
    end
  end
end


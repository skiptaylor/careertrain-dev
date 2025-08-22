Sequel.migration do
  change do
    create_table(:subtests) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at

      Text :name
      Text :abbr
      Text :name
    end
  end
end
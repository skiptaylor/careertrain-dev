Sequel.migration do
  change do
    create_table(:interests) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at

      Text :interest  
    end
  end
end
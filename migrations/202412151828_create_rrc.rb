Sequel.migration do
  change do
    create_table(:rrcs) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at

      String :email
      String :state
      String :status
    end
  end
end

Sequel.migration do
  change do
    create_table(:experiences) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at

      Integer :student_id
      String :company
      String :city
      String :state
      String :start
      String :end
      String :position
    end 
  end
end
Sequel.migration do
  change do
    create_table(:objectives) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at

      Text :goal
      Text :learn
      Text :long_goal
      
      Integer :student_id
    end
  end
end
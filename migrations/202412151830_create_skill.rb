Sequel.migration do
  change do
    create_table(:skills) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at

      Text :skill
      Text :applied_1
      Text :applied_2ext
      Text :applied_3
      Text :applied_4
      Integer :student_id
    end
  end
end
  
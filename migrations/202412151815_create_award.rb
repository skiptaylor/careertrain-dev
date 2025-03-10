Sequel.migration do
  change do
    create_table(:awards) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at

      Integer :student_id
      String :award
      String :award_date
    end
  end
end
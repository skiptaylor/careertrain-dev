Sequel.migration do
  change do
    create_table(:education) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at

      Integer :student_id
      
      String :attending
      String :graduate_on
      String :plan_attend
      String :completed
      String :completed_on
      String :graduated
      String :graduation_date
      String :study
      String :degree
    end
  end  
end
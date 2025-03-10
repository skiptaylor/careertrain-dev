Sequel.migration do
  change do
    create_table(:activities) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at

      String :position,     
      String :organization, 
      String :date_start,   
      String :date_end,     
      
      Integer :student_id,  
  
    end
  end
end

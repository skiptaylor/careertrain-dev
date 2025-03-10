Sequel.migration do
  change do
    create_table(:references) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at
	      
      Integer :student_id
      
      String :name
      String :relationship
      String :address
      String :city
      String :state
      String :zip
      String :phone
      String :email  
    end
  end
end
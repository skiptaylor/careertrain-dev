Sequel.migration do
  change do
    create_table(:admins) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at

      String :email  
      String :password 
      String :first_name  
      String :last_name  
      String :phone
	    String :pass_reset_key	
      
	    Date :pass_reset_date 
    end
  end
end

Sequel.migration do
  change do
    create_table(:reports) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at

      String :name           
      Text :body           
      String :program        
      String :first_highest  
      String :second_highest 
      String :third_highest 
    end
  end 
end

Sequel.migration do
  change do
    create_table(:recruiters) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at

      String :email
      String :password, BCryptHash
      Date :last_activity,
      String :rank
      String :first_name
      String :middle_name
      String :last_name
      String :address1
      String :address2
      String :city
      String :state
      String :zip
      String :phone
      Integer :ssnl4
      String :reg_code, default: "y5qz4"
      Boolean :recruiter_status, :default => false
      Boolean :active, :default => true
  
	    String :pass_reset_key
	    Date :pass_reset_date
    end
  end
end
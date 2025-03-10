Sequel.migration do
  change do
    create_table(:students) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at

      String :email 
      Text :password
      Date :last_activity
      Date :create_date
      
	    String :pass_reset_key
	    Date :pass_reset_date
      
      Boolean :agegate, :default => false
      
      String :name
      String :first_name
      String :middle_name
      String :last_name
      String :address
      String :address2
      String :city
      String :state
      String :zip
      String :phone
      
      Date :class_date
      
      String :school_password
      Integer :school_id
      String :sub_code
      String :score1
      String :score2
      String :score3
      
      String :high1_show
      String :high2_show
      String :ex_score1
      String :ex_score2
      
      Integer  :score_a, default: 0
      Integer  :score_b, default: 0
      Integer  :score_c, default: 0
      Integer  :score_d, default: 0
      Integer  :score_e, default: 0
      Integer  :score_f, default: 0
      Integer  :score_g, default: 0
      Integer  :score_h, default: 0
      Integer  :score_i, default: 0
      
      String :grade
      String  :future1
      String  :future2
      String  :future3
      String  :future4
      String  :future5
      String  :future6
      String  :future7
      String  :future8
      String  :future9
      
      Integer  :presentation_id, default: 0
    end
  end
end



# delete from students where email IS NULL;

# delete from students where deleted_at IS NOT NULL;
Sequel.migration do
  change do
    create_table(:schools) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at
      
      Integer :school_id
      
      String :date_modified
      String :first_name, default: ""
      String :middle_initial, default: ""
      String :last_name, default: ""
      String :school_name, default: ""
      String :school_address1, default: ""
      String :school_address2, default: ""
      String :school_city, default: ""
      String :school_state, default: ""
      String :school_zip, default: ""
      String :school_password, default: ""
      String :mail_address1, default: ""
      String :mail_address2, default: ""
      String :mail_city, default: ""
      String :mail_state, default: ""
      String :mail_zip, default: ""
      String :phone, default: ""
      String :fax, default: ""
      String :ng_rep, default: ""
      
      Text :email,   default: ""
      Text :arng_email,   default: ""
      
      Integer :number_seniors, default: 0
      
      Date :class_date
      
      Boolean :active, :default => true
      Boolean :cd, :default => false
      Boolean :ff, :default => false
      Boolean :cd_before, :default => false
    end
  end
end
  
  
  # before :create do |s|
#     if s.school_password == ''
#       zips = []
#       passwords = School.all(school_zip: s.school_zip).map { |s| zips << s.school_password }
#       passwords = passwords.sort{ |a, b| a <=> b }
#       if passwords.count == 0
#         code = '01'
#       else
#         code = zips.last
#         code[0, 7] = ''
#         code = code.to_i + 1
#       end
#       code = ("%02d" % code.to_i).to_s if code.to_i < 10
#       s.school_password = "cd#{s.school_zip}#{code}"
#     end
#   end
#

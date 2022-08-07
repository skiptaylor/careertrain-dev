class School
	include DataMapper::Resource

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial

  property :school_id,          Integer
  property :date_modified,      String
  property :first_name,         String, default: ""
  property :middle_initial,     String, default: ""
  property :last_name,          String, default: ""
  property :school_name,        String, default: ""
  property :school_address1,    String, default: ""
  property :school_address2,    String, default: ""
  property :school_city,        String, default: ""
  property :school_state,       String, default: ""
  property :school_zip,         String, default: ""
  property :school_password,    String, default: ""
  property :mail_address1,      String, default: ""
  property :mail_address2,      String, default: ""
  property :mail_city,          String, default: ""
  property :mail_state,         String, default: ""
  property :mail_zip,           String, default: ""
  property :phone,              String, default: ""
  property :fax,                String, default: ""
  property :ng_rep,             String, default: ""
  property :email,              Text,   default: ""
  property :arng_email,         Text,   default: ""
  property :number_seniors,     Integer, default: 0
  property :class_date,         Date
  
  property :active,             Boolean, :default => true
  property :cd,                 Boolean, :default => false
  property :ff,                 Boolean, :default => false
  property :cd_before,          Boolean, :default => false
  
  has n, :students
  has n, :presentations
  belongs_to :recruiter, required: false
 
  before :create do |s|
    if s.school_password == ''
      zips = []
      passwords = School.all(school_zip: s.school_zip).map { |s| zips << s.school_password }
      passwords = passwords.sort{ |a, b| a <=> b }
      if passwords.count == 0
        code = '01'
      else
        code = zips.last
        code[0, 7] = ''
        code = code.to_i + 1
      end
      code = ("%02d" % code.to_i).to_s if code.to_i < 10
      s.school_password = "cd#{s.school_zip}#{code}"
    end
  end
  
end
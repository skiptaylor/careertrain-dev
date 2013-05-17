class Client
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
  property :school_zip,         Integer
  property :school_password,    String, default: ""
  property :mail_address1,      String, default: ""
  property :mail_address2,      String, default: ""
  property :mail_city,          String, default: ""
  property :mail_state,         String, default: ""
  property :mail_zip,           Integer
  property :phone,              String, default: ""
  property :fax,                String, default: ""
  property :ng_rep,             String, default: ""
  property :email,              String, default: ""
  property :number_seniors,     Integer, default: 0
  
  property :active,             Boolean, :default => false
  property :cd,                 Boolean, :default => false
  property :ff,                 Boolean, :default => false
  property :cd_before,          Boolean, :default => false
  
end
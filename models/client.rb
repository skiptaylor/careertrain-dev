class Client
	include DataMapper::Resource

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial

  property :school_id,          Integer
  property :date_modified,      String
  property :first_name,         String
  property :middle_initial,     String
  property :last_name,          String
  property :school_name,        String
  property :school_address1,    String
  property :school_address2,    String
  property :school_city,        String
  property :school_state,       String
  property :school_zip,         String
  property :school_zip_unique,  String
  property :mail_address1,      String
  property :mail_address2,      String
  property :mail_city,          String
  property :mail_state,         String
  property :mail_zip,           String
  property :phone,              String
  property :fax,                String
  property :ng_rep,             String
  property :email,              String
  property :number_seniors,     Integer
  
  property :active,             Boolean, :default => true
  property :cd,                 Boolean, :default => true
  property :ff,                 Boolean, :default => true
  property :cd_before,          Boolean, :default => true
  
end
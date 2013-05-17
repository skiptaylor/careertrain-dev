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
  property :school_zip,         Integer, default: ""
  property :school_zip_unique,  Integer, default: ""
  property :mail_address1,      String, default: ""
  property :mail_address2,      String, default: ""
  property :mail_city,          String, default: ""
  property :mail_state,         Integer, default: ""
  property :mail_zip,           Integer, default: ""
  property :phone,              String, default: ""
  property :fax,                String, default: ""
  property :ng_rep,             String, default: ""
  property :email,              String, default: ""
  property :number_seniors,     Integer, default: 0
  
  property :active,             Boolean, :default => false
  property :cd,                 Boolean, :default => false
  property :ff,                 Boolean, :default => false
  property :cd_before,          Boolean, :default => false
  
  def generate_unique_password
    last_zip = Client.all(school_zip: self.school_zip, :school_zip_unique.not => nil, order: :school_zip_unique.asc).last.school_zip_unique
    last_zip = last_zip.to_i + 1
    last_zip = ("%02d" % last_zip).to_i if last_zip > 9
    self.update(school_zip_unique: last_zip)
  end

  after :save do
    self.generate_unique_password if self.school_zip_unique.nil? && !self.school_zip.nil?
  end

end
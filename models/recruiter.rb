class Recruiter
  include DataMapper::Resource

  timestamps :at, :on
  property   :deleted_at, ParanoidDateTime
  property   :id,         Serial

  property :email,  String
  property :password, String
  property :last_activity, Date
  property :rank,  String
  property :first_name,  String
  property :middle_name,  String
  property :last_name,  String
  property :address1, String
  property :address2, String
  property :city, String
  property :state, String
  property :zip, String
  property :phone, String
  property :ssnl4, Integer
  property :recruiter_status, Boolean, :default => false
  property :active, Boolean, :default => true
  
  has n, :schools
  has n, :presentations
  
end

def recruiter_name(id)
  "#{self.rank} #{self.first_name} #{self.middle_name} #{self.last_name}"
end


class Admin
  include DataMapper::Resource

  timestamps :at, :on
  property   :deleted_at, ParanoidDateTime
  property   :id,         Serial

  property :email,  String
  property :password, String
  property :first_name,  String
  property :last_name,  String
  property :phone, String
  
end

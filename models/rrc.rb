class Rrc
	include DataMapper::Resource

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial

  property :email,  String
  property :state,  String
  property :status, String
  
end

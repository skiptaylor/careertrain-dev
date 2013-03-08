class Interest
	include DataMapper::Resource

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial

  property :id_user,  String
  property :interest,  String
  
  belongs_to :user, required: false
  
end
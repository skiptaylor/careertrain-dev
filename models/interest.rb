class Interest
	include DataMapper::Resource

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial

  property :user_id,  Integer
  property :interest,  String
  
  belongs_to :user, required: false
  
end
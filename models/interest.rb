class Interest
	include DataMapper::Resource

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial

  property :interest,    Text
  
  belongs_to :student, required: false
  
end
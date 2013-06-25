class Interest
	include DataMapper::Resource

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial

  property :student_id,  Integer
  property :interest,  String
  
  belongs_to :student, required: false
  
end
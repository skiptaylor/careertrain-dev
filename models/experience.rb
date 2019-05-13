class Experience
	include DataMapper::Resource

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial

  property :student_id,   Integer
  property :company,      String
  property :city,         String
  property :state,        String
  property :start,        String
  property :end,          String
  property :position,     String
  
  belongs_to :student, required: false
  
end
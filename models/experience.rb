class Experience
	include DataMapper::Resource

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial

  property :student_id,  Integer
  property :company,  String
  property :city, String
  property :state, String
  property :start, Date
  property :end, Date
  property :position, String
  property :start_change, Date
  property :end_change, Date
  
  belongs_to :student, required: false
  
end
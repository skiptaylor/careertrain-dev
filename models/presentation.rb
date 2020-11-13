class Presentation
	include DataMapper::Resource

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial

  property :class_code,  String
  property :class_date,  Date
  property :number_students, Integer
  
  property :recruiter_id,  Integer
  property :school_id, Integer
  
  belongs_to :school, required: false
  has n, :students
  
end
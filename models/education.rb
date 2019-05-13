class Education
	include DataMapper::Resource

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial

  property :student_id,             Integer
  property :attending,              String
  property :graduate_on,            String
  property :plan_attend,            String
  property :completed,              String
  property :completed_on,           String
  property :graduated,              String
  property :graduation_date,        String
  property :study,                  String
  property :degree,                 String
  
  belongs_to :student, required: false
  
end
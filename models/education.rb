class Education
	include DataMapper::Resource

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial

<<<<<<< HEAD
  property :student_id,  Integer
  property :attending,  String
  property :graduate_on, Date
  property :plan_attend, String
  property :completed, String
  property :completed_on, Date
  property :graduated, String
  property :graduation_date, Date
  property :study, String
  property :grad_date_change, Date
  property :completed_date_change, Date
  property :graduation_date_change, Date
  property :degree, String
=======
  property :student_id,             Integer
  property :attending,              String
  property :graduate_on,            Date
  property :plan_attend,            String
  property :completed,              String
  property :completed_on,           Date
  property :graduated,              String
  property :graduation_date,        Date
  property :study,                  String
  property :grad_date_change,       Date
  property :completed_date_change,  Date
  property :graduation_date_change, Date
  property :degree,                 String
>>>>>>> 04204764821f5ccb783f47981a6f8f0e01abfb2f
  
  belongs_to :student, required: false
  
end
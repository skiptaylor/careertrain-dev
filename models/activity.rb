class Activity
	include DataMapper::Resource

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial

<<<<<<< HEAD
  property :position,  String
  property :organization,  String
  property :date_start, Date
  property :date_end, Date
  property :student_id, Integer
  property :date_start_change, Date
  property :date_end_change, Date
=======
  property :position,           String
  property :organization,       String
  property :date_start,         Date
  property :date_end,           Date
  property :student_id,         Integer
  property :date_start_change,  Date
  property :date_end_change,    Date
>>>>>>> 04204764821f5ccb783f47981a6f8f0e01abfb2f
  
  belongs_to :student, required: false
  
end

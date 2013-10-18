class Experience
	include DataMapper::Resource

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial

<<<<<<< HEAD
  property :student_id,  Integer
  property :company,  String
  property :city, String
  property :state, String
  property :start, Date
  property :end, Date
  property :position, String
  property :start_change, Date
  property :end_change, Date
=======
  property :student_id,   Integer
  property :company,      String
  property :city,         String
  property :state,        String
  property :start,        Date
  property :end,          Date
  property :position,     String
  property :start_change, Date
  property :end_change,   Date
>>>>>>> 04204764821f5ccb783f47981a6f8f0e01abfb2f
  
  belongs_to :student, required: false
  
end
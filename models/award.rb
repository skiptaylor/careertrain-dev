class Award
	include DataMapper::Resource

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial

<<<<<<< HEAD
  property :student_id,  Integer
  property :award,  String
  property :award_date, Date
  property :award_date_change, Date
=======
  property :student_id,         Integer
  property :award,              String
  property :award_date,         Date
  property :award_date_change,  Date
>>>>>>> 04204764821f5ccb783f47981a6f8f0e01abfb2f
  
  belongs_to :student, required: false
  
end
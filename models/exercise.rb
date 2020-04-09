class Exercise
	include DataMapper::Resource

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial

  property :student_id,   Integer
  property :scores,       Integer
  
  has n, :ies
  belongs_to :student, required: false
  
end

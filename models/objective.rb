class Objective
	include DataMapper::Resource

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial

  property :goal,       Text
  property :learn,      Text
  property :long_goal,  Text
  property :student_id, Integer
  
  belongs_to :student, required: false
  
end
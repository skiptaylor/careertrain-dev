class Objective
	include DataMapper::Resource

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial

  property :goal,  String
  property :learn,  String
  property :long_goal, String
  property :user_id, Integer
  
  belongs_to :student, required: false
  
end
class Objective
	include DataMapper::Resource

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial

  property :goal,  String
  property :learn,  String
  property :long_goal, String
  property :id_user, String
  
  belongs_to :user, required: false
  
end
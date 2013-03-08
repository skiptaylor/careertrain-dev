class Skill
	include DataMapper::Resource

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial

  property :skill,  String
  property :applied_1,  String
  property :applied_2, String
  property :applied_3, String
  property :applied_4, String
  property :id_user, String
  
  belongs_to :user, required: false
  
end
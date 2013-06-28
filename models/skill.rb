class Skill
	include DataMapper::Resource

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial

  property :skill,     Text
  property :applied_1, Text
  property :applied_2, Text
  property :applied_3, Text
  property :applied_4, Text
  property :student_id,   Integer
  
  belongs_to :student, required: false
  
end
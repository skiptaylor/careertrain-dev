class Trait
	include DataMapper::Resource

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial

  property :student_id,       Integer
  property :trait_1,          Text
  property :trait_2,          Text
  property :trait_3,          Text
  property :opening_sentence, Text
  
  belongs_to :student, required: false
  
end
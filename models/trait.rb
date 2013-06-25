class Trait
	include DataMapper::Resource

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial

  property :student_id,  Integer
  property :trait_1,  String
  property :trait_2, String
  property :trait_3, String
  property :opening_sentence,  String
  
  belongs_to :student, required: false
  
end
class Trait
	include DataMapper::Resource

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial

  property :user_id,  String
  property :trait_1,  String
  property :trait_2, String
  property :trait_3, String
  property :opening_sentence,  String
  
  belongs_to :user, required: false
  
end
class IeInterest
	include DataMapper::Resource

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial

  property :items,            String
  property :categorry,        String
  property :cat_scores,       Integer
  property :position_number,  Integer
  
  belongs_to :exercise
  
end
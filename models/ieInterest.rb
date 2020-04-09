class Ie
	include DataMapper::Resource

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial

  property :item,             String
  property :category,        String
  property :cat_scores,       Integer
  property :position_number,  Integer
  
  belongs_to :exercise, required: false
  
end
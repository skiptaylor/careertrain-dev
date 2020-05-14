class Ie
	include DataMapper::Resource

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial

  property  :item,              String
  property  :category,          String
  property  :position_number,   Integer
  property  :section,           Integer
  property  :answer_id,         Serial
  
  property :answer_yes,         Boolean, :default => false
  property :answer_no,          Boolean, :default => false
        
end 
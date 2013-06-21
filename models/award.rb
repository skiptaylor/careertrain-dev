class Award
	include DataMapper::Resource

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial

  property :user_id,  Integer
  property :award,  String
  property :award_date, String
  property :award_date_change, String
  
  belongs_to :student, required: false
  
end
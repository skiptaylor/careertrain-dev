class Award
	include DataMapper::Resource

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial

  property :id_user,  String
  property :award,  String
  property :award_date, String
  property :award_date_change, String
  
  belongs_to :user, required: false
  
end
class Activity
	include DataMapper::Resource

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial

  property :position,  String
  property :organization,  String
  property :date_start, String
  property :date_end, String
  property :id_user, String
  property :date_start_change, String
  property :date_end_change, String
  
  belongs_to :user, required: false
  
end

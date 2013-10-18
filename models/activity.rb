class Activity
	include DataMapper::Resource

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial

  property :position,  String
  property :organization,  String
  property :date_start, Date
  property :date_end, Date
  property :student_id, Integer
  property :date_start_change, Date
  property :date_end_change, Date
  
  belongs_to :student, required: false
  
end

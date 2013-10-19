class Activity
	include DataMapper::Resource

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial

  property :position,           String
  property :organization,       String
  property :date_start,         Date
  property :date_end,           Date
  property :student_id,         Integer
  
  belongs_to :student, required: false
  
end

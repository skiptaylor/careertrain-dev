class Education
	include DataMapper::Resource

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial

  property :id_user,  String
  property :attending,  String
  property :graduate_on, String
  property :plan_attend, String
  property :completed, String
  property :completed_on, String
  property :graduated, String
  property :graduation_date, String
  property :study, String
  property :grad_date_change, String
  property :completed_date_change, String
  property :graduation_date_change, String
  property :degree, String
  
  belongs_to :user, required: false
  
end
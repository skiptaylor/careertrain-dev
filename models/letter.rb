class Letter
	include DataMapper::Resource

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial

  property :title,      String
  property :first,      String
  property :last,       String
  property :position,   String
  property :student_id, Integer
  property :company,    Text
  property :address,    String
  property :city,       String
  property :state,      String
  property :zip,        String
  property :apply,      Text
  property :opening,    Text
  
  belongs_to :student, required: false
  
end
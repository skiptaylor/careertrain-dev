class Letter
	include DataMapper::Resource

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial

  property :title,  String
  property :first,  String
  property :last, String
  property :position, String
  property :user_id, Integer
  property :company, String
  property :address, String
  property :city, String
  property :state, String
  property :zip, String
  property :apply, String
  property :opening, String
  
  belongs_to :user, required: false
  
end
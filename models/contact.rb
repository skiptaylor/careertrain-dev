class Contact
	include DataMapper::Resource

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial

  property :user_id,  String
  property :name,  String
  property :address, String
  property :city, String
  property :state, String
  property :zip, String
  property :phone, String
  property :email, String
  property :last_activity, String
  
  belongs_to :user, required: false

end


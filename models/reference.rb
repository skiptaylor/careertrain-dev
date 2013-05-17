class Reference
	include DataMapper::Resource
	
	storage_names[:default] = "refs"

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial

  property :user_id,  Integer
  property :name,  String
  property :relationship, String
  property :address, String
  property :city,  String
  property :state,  String
  property :zip,  String
  property :phone,  String
  property :email,  String
  
  belongs_to :user, required: false
  
end
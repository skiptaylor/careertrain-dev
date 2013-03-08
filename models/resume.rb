class Resume
	include DataMapper::Resource

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial

  property :email, String
  property :password, String
  property :last_activity, String
  property :create_date, String
  
  has n, :contacts, :constraint => :destroy

end

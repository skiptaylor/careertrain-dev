class Report
	include DataMapper::Resource

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial

  property :name,           String
  property :body,           Text
  property :program,        String
  property :first_highest,  String
  property :second_highest, String
  property :third_highest,  String

end

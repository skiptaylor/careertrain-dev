class Student
  include DataMapper::Resource

  timestamps :at, :on
  property   :deleted_at, ParanoidDateTime
  property   :id,         Serial

  property :email,  String
  property :password, String
  property :last_activity, Date
  property :create_date, Date
  
  property :agegate,  Boolean, :default => false

 # From Contact
  property :name,  String
  property :address, String
  property :city, String
  property :state, String
  property :zip, String
  property :phone, String
  
  has n, :awards, :constraint => :destroy
  has n, :activities, :constraint => :destroy
  has n, :educations, :constraint => :destroy
  has n, :experiences, :constraint => :destroy
  has n, :interests, :constraint => :destroy
  has n, :letters, :constraint => :destroy
  has n, :objectives, :constraint => :destroy
  has n, :references, :constraint => :destroy
  has n, :reports, :constraint => :destroy
  has n, :skills, :constraint => :destroy
  has n, :traits, :constraint => :destroy
  
end


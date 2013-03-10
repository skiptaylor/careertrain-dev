class User
  include DataMapper::Resource

  timestamps :at, :on
  property   :deleted_at, ParanoidDateTime
  property   :id,         Serial

  property :email,    String
  property :password, String
  property :last_activity, String
  property :create_date, String
  
  has n, :contacts
  has n, :awards
  has n, :activities
  has n, :educations
  has n, :experiences
  has n, :interests
  has n, :letters
  has n, :objectives
  has n, :references
  has n, :reports
  has n, :skills
  has n, :traits
  
end

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

  property :name,  String
  property :first_name,  String
  property :middle_name,  String
  property :last_name,  String
  property :address, String
  property :address2, String
  property :city, String
  property :state, String
  property :zip, String
  property :phone, String
  property :birth_date, Date, :default => Chronic.parse('1900-01-01')
  property :school_password, String
  property :sub_code, String
  property :score1, String
  property :score2, String
  property :score3, String
  
  property :grade, String
  
  property  :future1, String
  property  :future2, String
  property  :future3, String
  property  :future4, String
  property  :future5, String
  property  :future6, String
  property  :future7, String
  property  :future8, String

  belongs_to :school, required: false
  belongs_to :presentation, required: false
  
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
  
  has n, :exercises, :constraint => :destroy
  
end


# delete from students where email IS NULL;

# delete from students where deleted_at IS NOT NULL;
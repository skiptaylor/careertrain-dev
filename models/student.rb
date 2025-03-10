class Student < Sequel::Model
  plugin :timestamps

  many_to_one :school, required: false
  many_to_one :presentation, required: false
  
  one_to_many :awards, :constraint => :destroy
  one_to_many :activities, :constraint => :destroy
  one_to_many :educations, :constraint => :destroy
  one_to_many :experiences, :constraint => :destroy
  one_to_many :interests, :constraint => :destroy
  one_to_many :letters, :constraint => :destroy
  one_to_many :objectives, :constraint => :destroy
  one_to_many :references, :constraint => :destroy
  one_to_many :reports, :constraint => :destroy
  one_to_many :skills, :constraint => :destroy
  one_to_many :traits, :constraint => :destroy
  
  one_to_many :exercises, :constraint => :destroy
  
end



# delete from students where email IS NULL;

# delete from students where deleted_at IS NOT NULL;
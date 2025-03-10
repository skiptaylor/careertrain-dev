class School < Sequel::Model
  plugin :timestamps

  one_to_many :students
  one_to_many :presentations
  many_to_one :recruiter, required: false
 
  
end
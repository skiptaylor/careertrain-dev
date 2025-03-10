class Recruiter < Sequel::Model
  plugin :timestamps
  
  one_to_many :schools
  one_to_many :presentations
  
  def recruiter_name
    "#{self.rank} #{self.first_name} #{self.middle_name} #{self.last_name}"
  end

  def reg_code(number)
    rand 1000..8000
  end
end
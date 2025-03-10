class Exercise < Sequel::Model
  plugin :timestamps
  
  many_to_one :student, required: false
end



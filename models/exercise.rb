class Exercise
	include DataMapper::Resource

	timestamps :at, :on
	property   :deleted_at, ParanoidDateTime
	property 	 :id, 				Serial
  
  property  :score_a,      Integer, default: 0
  property  :score_b,      Integer, default: 0
  property  :score_c,      Integer, default: 0
  property  :score_d,      Integer, default: 0
  property  :score_e,      Integer, default: 0
  property  :score_f,      Integer, default: 0
  property  :score_g,      Integer, default: 0
  property  :score_h,      Integer, default: 0
  property  :score_i,      Integer, default: 0
  
  property  :high1,        String
  property  :high2,        String
  
  belongs_to  :student, required: false

end




get "/student/reports/:id/exercise/?"  do
  @student = Student.get(params[:id])
  @ie = Ie.all
  @exercise = Exercise.new
  erb :"/student/reports/exercise", layout: false
end

post  "/student/reports/:id/exercise/?"  do
  student = Student.get(params[:id])
  ie = Ie.all
     
  exercise = Exercise.create(
    :student_id   => session[:student],
    :score_a      => params[:score_a],
    :score_b      => params[:score_b],
    :score_c      => params[:score_c],
    :score_d      => params[:score_d],
    :score_e      => params[:score_e],
    :score_f      => params[:score_f],
    :score_g      => params[:score_g],
    :score_h      => params[:score_h],
    :score_i      => params[:score_i],
    :high1        => params[:high1],
    :high2        => params[:high2],
  )
   
  exercise.score_a = 0
  exercise.score_b = 0
  exercise.score_c = 0
  exercise.score_d = 0
  exercise.score_e = 0
  exercise.score_f = 0
  exercise.score_g = 0
  exercise.score_h = 0
  exercise.score_i = 0
  exercise.high1 = 0
  exercise.high2 = 0
   
  Ie.each do |ie|
   
    if params[ie.position_number.to_s] == "true"
   
      case ie.category
      when "A"
        exercise.score_a = exercise.score_a + 1
      when "B"
        exercise.score_b = exercise.score_b + 1
      when "C"
        exercise.score_c = exercise.score_c + 1
      when "D"
        exercise.score_d = exercise.score_d + 1
      when "E"
        exercise.score_e = exercise.score_e + 1
      when "F"
        exercise.score_f = exercise.score_f + 1
      when "G"
        exercise.score_g = exercise.score_g + 1
      when "H"
        exercise.score_h = exercise.score_h + 1
      when "I"
        exercise.score_i = exercise.score_i + 1
      else
        puts "Unknown"
      end
   
    end
   
  end
  
  exercise.save
  
  score = {
    a:exercise.score_a,
    b:exercise.score_b,
    c:exercise.score_c,
    d:exercise.score_d,
    e:exercise.score_e,
    f:exercise.score_f,
    g:exercise.score_g,
    h:exercise.score_h,
    i:exercise.score_i
  }
  
  score = score.sort_by { |k,v| v }

  # puts score.to_h.keys
  
  # score.my_hash.keys
  
  exercise.high1 = score.fetch(8)
  exercise.high2 = score.fetch(7)
  
  exercise.save
  
  student.score_a = exercise.score_a
  student.score_b = exercise.score_b
  student.score_c = exercise.score_c
  student.score_d = exercise.score_d
  student.score_e = exercise.score_e
  student.score_f = exercise.score_f
  student.score_g = exercise.score_g
  student.score_h = exercise.score_h
  student.score_i = exercise.score_i
  
  if exercise.high1.include? "a"
    student.score1 = "a"
  elsif exercise.high1.include? "b"
    student.score1 = "b"
  elsif exercise.high1.include? "c"
    student.score1 = "c"
  elsif exercise.high1.include? "d"
    student.score1 = "d"
  elsif exercise.high1.include? "e"
    student.score1 = "e"
  elsif exercise.high1.include? "f"
    student.score1 = "f"
  elsif exercise.high1.include? "g"
    student.score1 = "g"
  elsif exercise.high1.include? "h"
    student.score1 = "h"
  elsif exercise.high1.include? "i"
    student.score1 = "i"
  end
  
  if exercise.high2.include? "a"
    student.score2 = "a"
  elsif exercise.high2.include? "b"
    student.score2 = "b"
  elsif exercise.high2.include? "c"
    student.score2 = "c"
  elsif exercise.high2.include? "d"
    student.score2 = "d"
  elsif exercise.high2.include? "e"
    student.score2 = "e"
  elsif exercise.high2.include? "f"
    student.score2 = "f"
  elsif exercise.high2.include? "g"
    student.score2 = "g"
  elsif exercise.high2.include? "h"
    student.score2 = "h"
  elsif exercise.high2.include? "i"
    student.score2 = "i"
  end
  
  # student.score1 = exercise.high1
#   student.score2 = exercise.high2
  
  student.save
    
  redirect "/student/reports/#{params[:id]}/report"
  
end
  
  
# score = [ ['a', exercise.score_a], ['b', exercise.score_b], ['c', exercise.score_c], ['d', exercise.score_d], ['e', exercise.score_e],['f', exercise.score_f], ['g', exercise.score_g], ['h', exercise.score_h], ['i', exercise.score_i] ]

# score = {
#   "a" => exercise.score_a,
#   "b" => exercise.score_b,
#   "c" => exercise.score_c,
#   "d" => exercise.score_d,
#   "e" => exercise.score_e,
#   "f" => exercise.score_f,
#   "g" => exercise.score_g,
#   "h" => exercise.score_h,
#   "i" => exercise.score_i
# }



  # score.each_key { |key| puts key }

  
  ## puts "#{score.invert}"
  
  # ------------- array - works --------------
  
  # score = [exercise.score_a,exercise.score_b,exercise.score_c,exercise.score_d,exercise.score_e,exercise.score_f,exercise.score_g,exercise.score_h,exercise.score_i]
  #
  # score.sort!
  #
  # exercise.high1 = score.fetch(8)
  # exercise.high2 = score.fetch(7)
  
  # ------------------------------------------
    


# hash.each_key {|key| puts key }

# score = {
#   a:exercise.score_a,
#   b:exercise.score_b,
#   c:exercise.score_c,
#   d:exercise.score_d,
#   e:exercise.score_e,
#   f:exercise.score_f,
#   g:exercise.score_g,
#   h:exercise.score_h,
#   i:exercise.score_i
# }


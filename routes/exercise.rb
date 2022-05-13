
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
    
    i:exercise.score_i,
    h:exercise.score_h,
    g:exercise.score_g,
    f:exercise.score_f,
    e:exercise.score_e,
    d:exercise.score_d,
    c:exercise.score_c,
    b:exercise.score_b,
    a:exercise.score_a
  }
  
  score = score.sort_by { |k,v| v }
  
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
    (student.score1 = "a") && (student.high1_show = "Outdoor")
  elsif exercise.high1.include? "b"
    (student.score1 = "b") && (student.high1_show = "Arts/Communications")
  elsif exercise.high1.include? "c"
    (student.score1 = "c") && (student.high1_show = "Business/Management")
  elsif exercise.high1.include? "d"
    (student.score1 = "d") && (student.high1_show = "Clerical/Administrative")
  elsif exercise.high1.include? "e"
    (student.score1 = "e") && (student.high1_show = "Protective/Military Service")
  elsif exercise.high1.include? "f"
    (student.score1 = "f") && (student.high1_show = "Technology")
  elsif exercise.high1.include? "g"
    (student.score1 = "g") && (student.high1_show = "Public Service")
  elsif exercise.high1.include? "h"
    (student.score1 = "h") && (student.high1_show = "Science/Mathematics")
  elsif exercise.high1.include? "i"
    (student.score1 = "i") && (student.high1_show = "Social/Helping")
  end
  
  if exercise.high2.include? "a"
    (student.score2 = "a") && (student.high2_show = "Outdoor")
  elsif exercise.high2.include? "b"
    (student.score2 = "b") && (student.high2_show = "Arts/Communications")
  elsif exercise.high2.include? "c"
    (student.score2 = "c") && (student.high2_show = "Business/Management")
  elsif exercise.high2.include? "d"
    (student.score2 = "d") && (student.high2_show = "Clerical/Administrative")
  elsif exercise.high2.include? "e"
    (student.score2 = "e") && (student.high2_show = "Protective/Military Service")
  elsif exercise.high2.include? "f"
    (student.score2 = "f") && (student.high2_show = "Technology")
  elsif exercise.high2.include? "g"
    (student.score2 = "g") && (student.high2_show = "Public Service")
  elsif exercise.high2.include? "h"
    (student.score2 = "h") && (student.high2_show = "Science/Mathematics")
  elsif exercise.high2.include? "i"
    (student.score2 = "i") && (student.high2_show = "Social/Helping")
  end
  
  student.save
  
  if settings.production?
    if student.exercises.count == 1
      Email.welcome(student.id, student.email, student.first_name, student.last_name, student.high1_show, student.high2_show)
    end
  else
    if student.exercises.count == 1
      flash[:alert] = 'Email would have been sent in production mode.'
    end
  end
    
  redirect "/student/reports/#{params[:id]}/report"
  
end
  
  
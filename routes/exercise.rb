
get "/student/reports/exercise/?"  do
  @student = Student.get(session[:student])
  @ie = Ie.all
  @exercise = Exercise.new
  erb :"/student/reports/exercise"
end

post  "/student/reports/exercise/?"  do
  student = Student.get(session[:student])
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
    :score_i      => params[:score_i]
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
  
   ie = Ie.each do |ie| 
     
   if ie.category == "A" && ie == "checked"
     exercise.score_a = exercise.score_a + 1
   end
   if ie.category == "B" 
     exercise.score_b = exercise.score_b + 1 
   end
    
   end
   exercise.save

   redirect "/student/reports/exercise"
end



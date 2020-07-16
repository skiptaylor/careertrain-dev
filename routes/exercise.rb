
get "/student/reports/:id/exercise/?"  do
  @student = Student.get(session[:student])
  @ie = Ie.all
  @exercise = Exercise.new
  erb :"/student/reports/exercise"
end

post  "/student/reports/:id/exercise/?"  do
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
    
   redirect "/student/reports/#{session[:student]}/ie_scores/?"
end

# get "/student/reports/:id/report/?" do
#   @student = Student.get(session[:student])
#   @exercise = Exercise.get(params[:id])
#
#   erb :"/student/reports/report"
# end

get "/student/reports/:id/ie_scores/?" do
  @student = Student.get(session[:student])
  @exercise = Exercise.get(params[:id])
  
  erb :"/student/reports/ie_scores"
end



post "/student/reports/:id/ie_scores/?" do
  exercise = Exercise.get(params[:id])
  student = Student.get(session[:student]).update(
    :score1     => params[:score1],
    :score2     => params[:score2]
  )

  redirect "/student/reports/#{session[:student]}/report/?"
end



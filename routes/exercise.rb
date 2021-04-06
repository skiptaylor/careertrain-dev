
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
  

  # h1 = [ ['a', exercise.score_a], ['b', exercise.score_b], ['c', exercise.score_c], ['d', exercise.score_d], ['e', exercise.score_e], ['f', exercise.score_f], ['g', exercise.score_g], ['h', exercise.score_h], ['i', exercise.score_i] ]
  # h2 = Hash[*h1.flatten]
  #
  # h2 = Hash[h1.map {|key, value| (key, value)}]
  #
  # h1.sort_by(&:last)
  #
  #
  #
  # exercise.high1 = h1(8)
  # exercise.high2 = Hash[fetch(7)]
  #
  # exercise.save
    
  redirect "/student/reports/#{params[:id]}/report"
end



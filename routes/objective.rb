get '/student/resume/objectives/new/?' do
  
  @student = Student.get(session[:student])
  @objective = Objective.new
  erb :'/student/resume/objectives/edit'
end

post '/student/resume/objectives/new/?' do
  
  @student = Student.get(session[:student])
  objective = Objective.create(
    :student_id => session[:student],
    :goal       => params[:goal],
    :learn      => params[:learn],
    :long_goal  => params[:long_goal]
  )
  redirect "/student/resume/index"
end

get '/student/resume/objectives/objectives/?' do
  
  @student = Student.get(session[:student])
  @objective = Objective.get(params[:id])
  erb :'/student/resume/objectives/objectives'
end

get '/student/resume/objectives/:id/edit/?' do
  
  @student = Student.get(session[:student])
  @objective = Objective.get(params[:id])
  erb :'/student/resume/objectives/edit'
end

post '/student/resume/objectives/:id/edit/?' do
  
  @student = Student.get(session[:student])
  objective = Objective.get(params[:id])
  objective.update(
    :student_id => session[:student],
    :goal       => params[:goal],
    :learn      => params[:learn],
    :long_goal  => params[:long_goal]
  )
  redirect "/student/resume/index"
end

get '/student/resume/objectives/:id/delete/?' do
  
  @student = Student.get(session[:student])
  objective = Objective.get(params[:id])
  objective.destroy
  redirect '/student/resume/objectives/objectives'
end

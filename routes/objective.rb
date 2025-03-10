get '/student/resume/objectives/new/?' do
  auth_student
  @student = Student[session[:student]]
  @objective = Objective.new
  erb :'/student/resume/objectives/edit'
end

post '/student/resume/objectives/new/?' do
  auth_student
  @student = Student[session[:student]]
  objective = Objective.create(
    :student_id => session[:student],
    :goal       => params[:goal],
    :learn      => params[:learn],
    :long_goal  => params[:long_goal]
  )
  redirect "/student/resume/index"
end

get '/student/resume/objectives/objectives/?' do
  auth_student
  @student = Student[session[:student]]
  @objective = Objective[params[:id]]
  erb :'/student/resume/objectives/objectives'
end

get '/student/resume/objectives/:id/edit/?' do
  auth_student
  @student = Student[session[:student]]
  @objective = Objective[params[:id]]
  erb :'/student/resume/objectives/edit'
end

post '/student/resume/objectives/:id/edit/?' do
  auth_student
  @student = Student[session[:student]]
  objective = Objective[params[:id]]
  objective.update(
    :student_id => session[:student],
    :goal       => params[:goal],
    :learn      => params[:learn],
    :long_goal  => params[:long_goal]
  )
  redirect "/student/resume/index"
end

get '/student/resume/objectives/:id/delete/?' do
  auth_student
  @student = Student[session[:student]]
  objective = Objective[params[:id]]
  objective.destroy
  redirect '/student/resume/objectives/objectives'
end

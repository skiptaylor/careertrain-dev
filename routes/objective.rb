get '/student/resume/objectives/?' do
  @student = Student.get(session[:student])
	@objective = Objective.all
	erb :'/student/resume/objectives/edit'
end

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
  redirect "/student/resume/objectives/#{objective.id}/edit"
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
  redirect "/student/resume/objectives/#{objective.id}/edit"
end

get '/student/objectives/:id/delete/?' do
  @student = Student.get(session[:student])
  objective = Objective.get(params[:id])
  objective.destroy
  redirect '/student/resume/objectives/new'
end
